

#pragma once

#include <algorithm>
#include <cmath>
#include <deque>
#include <memory>

#include "HET_cost-class.hpp"
#include "HET_logger.hpp"
#include "HET_proccessor-assignment-engine.hpp"
#include "HET_scoring-module.hpp"
#include "HET_timer.hpp"
#include "HET_load-generator.hpp"

//#define DEBUG_HET_RUNTIME


namespace maestro{
  namespace HET {
    class Runtime {
      public:
        Runtime(
            float max_jitter,
            ProcessorAssignmentStrategy scheduling_policy,
            std::shared_ptr<std::vector<std::shared_ptr<DFA::NeuralNetwork>>> workloads,
            std::shared_ptr<ConvCostClass> cost_class,
            std::shared_ptr<HET::Logger> logger,
            std::shared_ptr<HET::ScoringModule> scoring_module
        ):
          scheduling_policy_(scheduling_policy),
          workloads_(workloads),
          cost_class_(cost_class),
          logger_(logger),
          scoring_module_(scoring_module) {

          int min_fps = 0;
          for(auto it: *workloads) {
            min_fps = std::min(min_fps, it->GetFPS());
          }
          current_time_ = 0.0;

          // Initialize internal data structures
          request_queue_ = std::make_shared<std::map<std::string, std::shared_ptr<std::deque<std::shared_ptr<InferenceRequest>>>>>();
          active_job_queue_ = std::make_shared<std::vector<std::shared_ptr<InferenceProcess>>> (); // size: num_accs

          int num_accs = cost_class->GetNumProcs();

          for(int acc_id = 0; acc_id < num_accs; acc_id++) {
            active_job_queue_->push_back(nullptr);
          }

          // Initialize internal modules
          // TODO: Modularize the code
          load_generator_ = std::make_shared<LoadGenerator>(max_jitter, workloads);
          timer_ = std::make_shared<Timer>(max_jitter, workloads, active_job_queue_);

        }

        void RunWorkloads(float ms_to_run) {
          bool is_active_job_queue_empty = true;
          bool is_request_queue_empty = true;
          current_time_ = 0;

          load_generator_->Initialize(ms_to_run);
          while(
            load_generator_->HasRemainingWorks(current_time_)
            && is_active_job_queue_empty
            && is_request_queue_empty
          ) {
            #ifdef DEBUG_HET_RUNTIME
            std::cout << "Current time : " << current_time_ << std::endl;
            #endif 
            // Receive new inference requests from the load generator
            this->FetchNewInferenceRequests(current_time_);
            #ifdef DEBUG_HET_RUNTIME            
            std::cout << "FetchNewInferenceRequests" << std::endl;
            #endif 

            // Remove finished inferences on active job queues
            this->RemoveFinishedProcesses(current_time_);
            #ifdef DEBUG_HET_RUNTIME            
            std::cout << "RemoveFinishedProcesses" << std::endl;
            #endif 

            // Check if there's an inference request whose deadline is violated
            this->DropLateFrames(current_time_);
            #ifdef DEBUG_HET_RUNTIME            
            std::cout << "DropLateFrames" << std::endl;
            #endif 

            // Check if there are schedulable inferences in the request queue and
            // dispatch them
            this->DispatchJobs(current_time_);
            #ifdef DEBUG_HET_RUNTIME            
            std::cout << "DispatchJobs" << std::endl;
            #endif 

            // Move on to the next event time
            current_time_= timer_->GetNextEventTime();
          }

          is_active_job_queue_empty = true;
          for(auto process : *active_job_queue_) {
            if(process != nullptr) {
              is_active_job_queue_empty = false;
              break;
            }
          }

          is_request_queue_empty = true;
          for(auto it : *request_queue_) {
            auto request = it.second;

            if(!request->empty()) {
              is_request_queue_empty = false;
              break;
            }
          }
        }

        float GetScore() {
          return scoring_module_->ComputeScore(logger_);
        }

      protected:
        float current_time_;
        ProcessorAssignmentStrategy scheduling_policy_;

        std::shared_ptr<ConvCostClass> cost_class_;
        std::shared_ptr<std::vector<std::shared_ptr<DFA::NeuralNetwork>>> workloads_;


        std::shared_ptr<std::map<std::string, std::shared_ptr<std::deque<std::shared_ptr<InferenceRequest>>>>> request_queue_;
        std::map<std::string, int> completion_list_;

        std::shared_ptr<std::vector<std::shared_ptr<InferenceProcess>>> active_job_queue_; // size: num_accs
        std::shared_ptr<HET::Logger> logger_;
        std::shared_ptr<HET::ScoringModule> scoring_module_;
        std::shared_ptr<HET::LoadGenerator> load_generator_;
        std::shared_ptr<Timer> timer_;


      private:

        void FetchNewInferenceRequests(float current_time) {
          auto new_requests = load_generator_->GetNewInferenceRequests(current_time);

          for(auto req : *new_requests) {
            auto model_name = req.first;
            auto inf_req = req.second;
            if(request_queue_->find(model_name) == request_queue_->end()) {
              (*request_queue_)[model_name] = std::make_shared<std::deque<std::shared_ptr<InferenceRequest>>>();
            }
            (*request_queue_)[model_name]->push_back(inf_req);
          }
        }

        void RemoveFinishedProcesses(float current_time) {

          int acc_id = 0;
          #ifdef DEBUG_HET_RUNTIME
          std::cout << "[Runtime->RemoveFinishedProcesses] active_job_queue_ size: " << active_job_queue_->size() << std::endl;
          #endif
          for(auto current_process: *active_job_queue_) {
            #ifdef DEBUG_HET_RUNTIME            
            std::cout << "[Runtime->RemoveFinishedProcesses] acc_id: " << acc_id << std::endl;
            #endif
            if(current_process != nullptr) {
              #ifdef DEBUG_HET_RUNTIME
              std::cout << "<<<<<<<< Process removal >>>>>>>>>>" << std::endl;
              std::cout << "Current time: " << current_time << std::endl;
              std::cout << "Current process completion time: " << current_process->GetCompletionTime() << std::endl;
              #endif
              if(current_process->IsFinished(current_time)) {
                //std::cout << "The process is removed!!!!!!!!!!!" << std::endl;
                auto model_name = current_process->GetModelName();
                logger_->AddLog(
                  acc_id,
                  model_name,
                  current_process->GetFrameID(),
                  current_process->GetInjectionTime(),
                  current_process->GetDispatchTime(),
                  current_process->GetDeadline(),
                  current_process->GetCompletionTime(),
                  current_process->GetEnergy(),
                  false // this is a process in an active job queue
                );
                if(completion_list_.find(model_name) == completion_list_.end()) {
                  completion_list_[model_name] = -1;
                }
                completion_list_[model_name] += 1;
                active_job_queue_->at(acc_id) = nullptr;
              } // End of if(current_process->IsFinished(current_time))
            } // End of if(current_process != nullptr)
            acc_id++;
          } // End of for(auto current_process: *active_job_queue_)
        } // End of void RemoveFinishedProcesses(float current_time)

        void DropLateFrames(float current_time) {
          bool has_changes = true;
          while(has_changes) {
            has_changes = false;
            for(auto it: *request_queue_) {
              auto this_request_queue = it.second;
              if(!this_request_queue->empty()) {
                auto oldest_request = this_request_queue->front();
                if(oldest_request->IsDropped(current_time)) {
                  // Deque the invalid request (deadline is already passed)
                  logger_->AddLog(
                    0, // Was not assigned to any accelerator
                    oldest_request->GetModelName(),
                    oldest_request->GetFrameID(),
                    oldest_request->GetInjectionTime(),
                    current_time,
                    oldest_request->GetDeadline(),
                    current_time,
                    0, // The energy of dropped frame = 0
                    true // this is a dropped frame
                  );
                  this_request_queue->pop_front();

                  for(auto it2: *request_queue_) {
                    auto this_request_queue2 = it2.second;
                    if ((it != it2) && (!this_request_queue2->empty())) {
                      auto oldest_request2 = this_request_queue2->front();
                      bool iSValidFrameID = false;
                      while(!iSValidFrameID) {
                        auto dependency_list = oldest_request2->GetDependencyList();
                        int oldest_frame_id2 = oldest_request2->GetFrameID();
                        iSValidFrameID = true;

                        if(dependency_list->size() != 0) {
                          for(auto dep_model: *dependency_list) {
                            if(dep_model == oldest_request2->GetModelName()) {
                              if(oldest_request->GetFrameID() >= oldest_frame_id2) {
                                // Drop follow-up request in dependency chain
                                // TODO: This needs to be recursive to cover general cases
                                //       Current verison only works for two-model dependency chains
                                //       which is ok for the current version of XRBench
                                logger_->AddLog(
                                  0, // Was not assigned to any accelerator
                                  oldest_request2->GetModelName(),
                                  oldest_request2->GetFrameID(),
                                  oldest_request2->GetInjectionTime(),
                                  current_time,
                                  oldest_request2->GetDeadline(),
                                  current_time,
                                  0, // The energy of dropped frame = 0
                                  true // this is a dropped frame
                                );
                                this_request_queue2->pop_front();
                                iSValidFrameID = false;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  has_changes=true;
                }
              }
            }
          }
        } // End of  void DropLateFrames(float current_time)

        void DispatchJobs(float current_time) {
          #ifdef DEBUG_HET_RUNTIME          
          std::cout << "DispatchJobs @ " << current_time_ << std::endl;
          #endif
          bool has_changes = true;
          while(has_changes) {
            has_changes = false;
            // For each top inference request in each queue for each model
            // (i.e., for the oldest inference request for each model)
            for(auto inf_req: *request_queue_) {
              auto inf_req_queue = inf_req.second;
              if(inf_req_queue->size() == 0) {
                continue; // No request on this model has arrived
              }
              auto top_req = inf_req_queue->at(0);
              auto model_name = top_req->GetModelName();
              #ifdef DEBUG_HET_RUNTIME              
              std::cout << "Checking inference request on " << model_name << ", frame_id = " << top_req->GetFrameID() << std::endl;
              #endif
              if(top_req->HasInputData(current_time)) {
                auto dependency_list = top_req->GetDependencyList();
                int current_frame_id= top_req->GetFrameID();

                bool is_dep_satisfied = true;
                for(auto dep_model: *dependency_list) {
                  if(completion_list_.find(dep_model) == completion_list_.end()) {
                    completion_list_[dep_model] = -1;
                  }

                  auto last_frame_id = completion_list_[dep_model];
                  #ifdef DEBUG_HET_RUNTIME
                  std::cout << "[Runtime] Dependency check for model " << model_name << std::endl;
                  std::cout << "[Runtime] last frame id of model " << dep_model  << " = " << last_frame_id << std::endl;
                  std::cout << "[Runtime] current frame id of model " << model_name  << " = " << current_frame_id << std::endl;
                  #endif

                  if(last_frame_id < current_frame_id) {
                    is_dep_satisfied = false;
                  }
                }

                std::vector<int> idle_accelerators;
                int acc_id = 0;
                for(auto job : *active_job_queue_) {
                  if(job == nullptr) {
                    idle_accelerators.push_back(acc_id);
                  }
                  acc_id++;
                }

                auto num_idle_accelerators =idle_accelerators.size();

                if(num_idle_accelerators != 0 && is_dep_satisfied) {
                  std::map<int, long> total_latency;
                  std::map<int, double> total_energy;
                  std::map<int, double> total_edp;

                  auto model = top_req->GetModel();
                  int num_layers = model->GetNumLayers();

                  int model_id = 0;
                  for(auto it: *workloads_) {
                    if(it->GetName() == model_name) {
                      break;
                    }
                    model_id++;
                  }

                  assert (model_id >= 0);

                  // Estimate total latency, energy, and EDP on each accelerator
                  for(int idle_acc_id = 0; idle_acc_id < idle_accelerators.size(); idle_acc_id++) {
                    int target_acc_id = idle_accelerators[idle_acc_id];
                    total_latency[target_acc_id] = 0;
                    total_energy[target_acc_id] = 0;
                    total_edp[target_acc_id] = 0;
                    for(auto layer_id = 0; layer_id < num_layers; layer_id++) {
                      auto this_layer_latency = cost_class_->GetLatency(target_acc_id, model_id, layer_id);
                      auto this_layer_energy = cost_class_->GetEnergy(target_acc_id, model_id, layer_id);

                      total_latency[target_acc_id] += this_layer_latency;
                      total_energy[target_acc_id] += this_layer_energy;
                      total_edp[target_acc_id] += this_layer_latency * this_layer_energy;
                    }
                  }


                    int sched_acc_id = -1;
                    // Depending on the scheduling policy, select the best accelerator
                  if(scheduling_policy_ == maestro::HET::ProcessorAssignmentStrategy::EDPGreedy) {
                    // Find the accelerator with the minimum EDP
                    double min_EDP = std::numeric_limits<double>::max();
                    for(auto x : total_edp) {
                      if(min_EDP > x.second) {
                        sched_acc_id = x.first;
                        min_EDP = x.second;
                      }
                    }
                  }
                  else if(scheduling_policy_ == maestro::HET::ProcessorAssignmentStrategy::LatencyGreedy) {
                    // Find the accelerator with the minimum latency
                    double min_latency = std::numeric_limits<double>::max();
                    for(auto x : total_latency) {
                      if(min_latency > x.second) {
                        sched_acc_id = x.first;
                        min_latency = x.second;
                      }
                    }
                  }

                  //TODO: 1GHz clock is hard-coded here. Make it configurable
                  auto new_inference_process = std::make_shared<InferenceProcess>(current_time, top_req);
                  new_inference_process->SetLatency(static_cast<float>(total_latency[sched_acc_id])/1000000);
                  new_inference_process->SetEnergy(total_energy[sched_acc_id]/1000000);

                  #ifdef DEBUG_HET_RUNTIME          
                  std::cout << "[Runtime] Dispatching model " << model_name << ", frame = " << current_frame_id << std::endl;
                  std::cout << "Setting Latency: " << total_latency[sched_acc_id] << " cycles" << std::endl;
                  std::cout << "Setting Latency: " << static_cast<float>(total_latency[sched_acc_id])/1000000 << " ms" << std::endl;
                  std::cout << "Setting Energy: " << total_energy[sched_acc_id] << " nJ" << std::endl;
                  std::cout << "Setting Energy: " << total_energy[sched_acc_id]/1000000 << " mJ" << std::endl;
                  #endif
                  

                  active_job_queue_->at(sched_acc_id) = new_inference_process;
                  inf_req_queue->pop_front();
                  has_changes=true;
                } // End of if(idle_accelerators.size != 0)
              } // End of if(inf_req->HasInputData(current_time))
            } // End of for(auto inf_req: *request_queue_)
          } // End of while(has_changes)
        } // End of void DispatchJobs(float current_time)

    }; // End of class Runtime
  }; // End of namespace HET
}; // End of namespace maestro

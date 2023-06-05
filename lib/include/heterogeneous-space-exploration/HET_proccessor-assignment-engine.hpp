#ifndef MAESTRO_HET_PROCESSOR_ASSIGNMENT_ENGINE_HPP_
#define MAESTRO_HET_PROCESSOR_ASSIGNMENT_ENGINE_HPP_


#include <vector>
#include <memory>

#include "DFA_layer.hpp"

#include "HET_cost-class.hpp"
#include "HET_task.hpp"


namespace maestro{
  namespace HET {

    enum class ProcessorAssignmentStrategy {Even, EnergyGreedy, LatencyGreedy, EDPGreedy, ED2PGreedy, EDPBalanced, LatencyBalanced, NumStrategies};

    template <class TaskClass>
    class ProcessorAssignmentEngine {

      public:
        ProcessorAssignmentEngine(
            std::shared_ptr<CostClass<DFA::Layer>> cost_class,
            ProcessorAssignmentStrategy strategy) :
          cost_class_(cost_class),
          strategy_(strategy) {

          proc_assignments_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<TaskInfo<TaskClass>>>>>>();
          int num_procs = cost_class->GetNumProcs();

          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            auto proc_base_assignment_vector = std::make_shared<std::vector<std::shared_ptr<TaskInfo<TaskClass>>>>();
            proc_assignments_->push_back(proc_base_assignment_vector);
          }
        }

        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<TaskInfo<TaskClass>>>>>> DoAssignment() {

          switch(strategy_) {
            case ProcessorAssignmentStrategy::EnergyGreedy: {
              DoEnergyGreedyAssignment();
              break;
            }
            case ProcessorAssignmentStrategy::LatencyGreedy: {
              DoLatencyGreedyAssignment();
              break;
            }
            case ProcessorAssignmentStrategy::EDPGreedy: {
              DoEDPGreedyAssignment();
              break;
            }
            case ProcessorAssignmentStrategy::ED2PGreedy: {
              DoED2PGreedyAssignment();
              break;
            }
            case ProcessorAssignmentStrategy::EDPBalanced: {
              DoEDPBalanceAssignment();
              break;
            }
            case ProcessorAssignmentStrategy::LatencyBalanced: {
              DoLatencyBalanceAssignment();
              break;
            }
            default: {
              //Do nothing
              break;
            }
          }

          return proc_assignments_;
        }

        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<TaskInfo<TaskClass>>>>>> GetAssignmentResults() {
          return proc_assignments_;
        }

      protected:
        ProcessorAssignmentStrategy strategy_;
        std::shared_ptr<CostClass<DFA::Layer>> cost_class_;

        //proc_assignemnts_[proc][tasks]
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<TaskInfo<TaskClass>>>>>> proc_assignments_;

      private:

        void DoEnergyGreedyAssignment() {
          int num_models = cost_class_->GetNumModels();

          for(int model_id = 0; model_id < num_models; model_id++) {
            int num_layers = cost_class_->GetNumLayers(model_id);

            for(int layer_id = 0; layer_id < num_layers; layer_id++) {
              int num_procs  = cost_class_->GetNumProcs();
              int assigned_proc_id = -1;
              double min_energy = std::numeric_limits<double>::max();

              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                double proc_energy = cost_class_->GetEnergy(proc_id, model_id, layer_id);
                if(proc_energy < min_energy) {
                  min_energy = proc_energy;
                  assigned_proc_id = proc_id;
                }
              }

              assert(assigned_proc_id >= 0);

              auto assigned_task = cost_class_->GetTaskInfo(model_id, layer_id);
              proc_assignments_->at(assigned_proc_id)->push_back(assigned_task);
            } // End of for(layer_id)
          } // End of for(model_id)
        } // End of function DoEnergyGreedyAssignment();

        void DoLatencyGreedyAssignment() {
          int num_models = cost_class_->GetNumModels();

          for(int model_id = 0; model_id < num_models; model_id++) {
            int num_layers = cost_class_->GetNumLayers(model_id);

            for(int layer_id = 0; layer_id < num_layers; layer_id++) {
              int num_procs  = cost_class_->GetNumProcs();
              int assigned_proc_id = -1;
              long min_latency = std::numeric_limits<long>::max();

              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                long proc_latency = cost_class_->GetLatency(proc_id, model_id, layer_id);
                if(proc_latency < min_latency) {
                  min_latency = proc_latency;
                  assigned_proc_id = proc_id;
                }
              }

              assert(assigned_proc_id >= 0);

              auto assigned_task = cost_class_->GetTaskInfo(model_id, layer_id);
              proc_assignments_->at(assigned_proc_id)->push_back(assigned_task);
            } // End of for(layer_id)
          } // End of for(model_id)

        }

        void DoEDPGreedyAssignment() {
          int num_models = cost_class_->GetNumModels();

          for(int model_id = 0; model_id < num_models; model_id++) {
            int num_layers = cost_class_->GetNumLayers(model_id);

            for(int layer_id = 0; layer_id < num_layers; layer_id++) {
              int num_procs  = cost_class_->GetNumProcs();
              int assigned_proc_id = -1;
              double min_edp = std::numeric_limits<double>::max();

              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                double proc_energy = cost_class_->GetEnergy(proc_id, model_id, layer_id);
                long proc_latency = cost_class_->GetLatency(proc_id, model_id, layer_id);
                double proc_edp = proc_energy * proc_latency;
                if(proc_edp < min_edp) {
                  min_edp = proc_edp;
                  assigned_proc_id = proc_id;
                }
              }

              assert(assigned_proc_id >= 0);

              auto assigned_task = cost_class_->GetTaskInfo(model_id, layer_id);
              proc_assignments_->at(assigned_proc_id)->push_back(assigned_task);
            } // End of for(layer_id)
          } // End of for(model_id)
        } // End of function DoEnergyGreedyAssignment();
/*
        void DoEDPBalanceAssignment() {
          int num_models = cost_class_->GetNumModels();
          int num_procs  = cost_class_->GetNumProcs();
          std::shared_ptr<std::vector<double>> gross_edp = std::make_shared<std::vector<double>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            gross_edp->push_back(0);
          }

          for(int model_id = 0; model_id < num_models; model_id++) {
            int num_layers = cost_class_->GetNumLayers(model_id);


            for(int layer_id = 0; layer_id < num_layers; layer_id++) {
              int assigned_proc_id = -1;
              double min_edp = std::numeric_limits<double>::max();

              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                double proc_energy = cost_class_->GetEnergy(proc_id, model_id, layer_id);
                long proc_latency = cost_class_->GetLatency(proc_id, model_id, layer_id);
                double proc_edp = proc_energy * proc_latency;
                if(proc_edp < min_edp) {
                  min_edp = proc_edp;
                  assigned_proc_id = proc_id;
                }
              }

              long long min_gross_latency =  std::numeric_limits<long long>::max();
              int min_gross_latency_proc = 0;
              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                double proc_gross_edp = gross_edp->at(proc_id);
                if(min_gross_latency_proc > proc_gross_latency) {
                  min_gross_latency_proc = proc_id;
                }
              }

              if(assigned_proc_id != min_gross_latency_proc) {
                double proc_energy = cost_class_->GetEnergy(min_gross_latency_proc, model_id, layer_id);
                long proc_latency = cost_class_->GetLatency(min_gross_latency_proc, model_id, layer_id);
                double proc_edp = proc_energy * proc_latency;

                if(min_edp * 2 > proc_edp) {
                  assigned_proc_id = min_gross_latency_proc;
                }
              }

              assert(assigned_proc_id >= 0);

              auto assigned_task = cost_class_->GetTaskInfo(model_id, layer_id);
              proc_assignments_->at(assigned_proc_id)->push_back(assigned_task);

              gross_latency->at(assigned_proc_id) += cost_class_->GetLatency(assigned_proc_id, model_id, layer_id);;

            } // End of for(layer_id)
          } // End of for(model_id)
        } // End of function DoEDPBalanceAssignment();
*/

        void DoEDPBalanceAssignment() {
          int num_models = cost_class_->GetNumModels();
          int num_procs  = cost_class_->GetNumProcs();
          std::shared_ptr<std::vector<long long >> gross_latency = std::make_shared<std::vector<long long>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            gross_latency->push_back(0);
          }

          for(int model_id = 0; model_id < num_models; model_id++) {
            int num_layers = cost_class_->GetNumLayers(model_id);


            for(int layer_id = 0; layer_id < num_layers; layer_id++) {
              int assigned_proc_id = -1;
              double min_edp = std::numeric_limits<double>::max();

              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                double proc_energy = cost_class_->GetEnergy(proc_id, model_id, layer_id);
                long long proc_latency = cost_class_->GetLatency(proc_id, model_id, layer_id);
                double proc_edp = proc_energy * proc_latency;
                if(proc_edp < min_edp) {
                  min_edp = proc_edp;
                  assigned_proc_id = proc_id;
                }
              }

              long long min_gross_latency =  std::numeric_limits<long long>::max();
              int min_gross_latency_proc = 0;
              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                long long proc_gross_latency = gross_latency->at(proc_id);
                if(min_gross_latency > proc_gross_latency) {
                  min_gross_latency_proc = proc_id;
                  min_gross_latency = proc_gross_latency;
                }
              }

              if(assigned_proc_id != min_gross_latency_proc) {
                double proc_energy = cost_class_->GetEnergy(min_gross_latency_proc, model_id, layer_id);
                long proc_latency = cost_class_->GetLatency(min_gross_latency_proc, model_id, layer_id);
                double proc_edp = proc_energy * proc_latency;

                if(proc_edp < min_edp * 2) {
                  assigned_proc_id = min_gross_latency_proc;
                }
              }

              assert(assigned_proc_id >= 0);

              auto assigned_task = cost_class_->GetTaskInfo(model_id, layer_id);
              proc_assignments_->at(assigned_proc_id)->push_back(assigned_task);

              gross_latency->at(assigned_proc_id) += cost_class_->GetLatency(assigned_proc_id, model_id, layer_id);;

            } // End of for(layer_id)
          } // End of for(model_id)
        } // End of function DoEDPBalanceAssignment();


        void DoLatencyBalanceAssignment() {
          int num_models = cost_class_->GetNumModels();
          int num_procs  = cost_class_->GetNumProcs();
          std::shared_ptr<std::vector<long long >> gross_latency = std::make_shared<std::vector<long long>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            gross_latency->push_back(0);
          }

          for(int model_id = 0; model_id < num_models; model_id++) {
            int num_layers = cost_class_->GetNumLayers(model_id);


            for(int layer_id = 0; layer_id < num_layers; layer_id++) {
              int assigned_proc_id = -1;
              long long min_latency = std::numeric_limits<long long>::max();

              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                long long proc_latency = cost_class_->GetLatency(proc_id, model_id, layer_id);
                if(proc_latency < min_latency) {
                  min_latency = proc_latency;
                  assigned_proc_id = proc_id;
                }
              }

              long long min_gross_latency =  std::numeric_limits<long long>::max();
              int min_gross_latency_proc = 0;
              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                long long proc_gross_latency = gross_latency->at(proc_id);
                if(min_gross_latency > proc_gross_latency) {
                  min_gross_latency_proc = proc_id;
                  min_gross_latency = proc_gross_latency;
                }
              }

              if(assigned_proc_id != min_gross_latency_proc) {
                double proc_energy = cost_class_->GetEnergy(min_gross_latency_proc, model_id, layer_id);
                long long proc_latency = cost_class_->GetLatency(min_gross_latency_proc, model_id, layer_id);

                if(proc_latency < min_latency * 2) {
                  assigned_proc_id = min_gross_latency_proc;
                }
              }

              assert(assigned_proc_id >= 0);

              auto assigned_task = cost_class_->GetTaskInfo(model_id, layer_id);
              proc_assignments_->at(assigned_proc_id)->push_back(assigned_task);

              gross_latency->at(assigned_proc_id) += cost_class_->GetLatency(assigned_proc_id, model_id, layer_id);;

            } // End of for(layer_id)
          } // End of for(model_id)
        } // End of function DoEDPBalanceAssignment();

        void DoED2PGreedyAssignment() {
          int num_models = cost_class_->GetNumModels();

          for(int model_id = 0; model_id < num_models; model_id++) {
            int num_layers = cost_class_->GetNumLayers(model_id);

            for(int layer_id = 0; layer_id < num_layers; layer_id++) {
              int num_procs  = cost_class_->GetNumProcs();
              int assigned_proc_id = -1;
              double min_edp = std::numeric_limits<double>::max();

              for(int proc_id = 0; proc_id < num_procs; proc_id++) {
                double proc_energy = cost_class_->GetEnergy(proc_id, model_id, layer_id);
                long proc_latency = cost_class_->GetLatency(proc_id, model_id, layer_id);
                double proc_edp = proc_energy * proc_latency * proc_latency;
                if(proc_edp < min_edp) {
                  min_edp = proc_edp;
                  assigned_proc_id = proc_id;
                }
              }

              assert(assigned_proc_id >= 0);

              auto assigned_task = cost_class_->GetTaskInfo(model_id, layer_id);
              proc_assignments_->at(assigned_proc_id)->push_back(assigned_task);
            } // End of for(layer_id)
          } // End of for(model_id)
        } // End of function DoEnergyGreedyAssignment();




    }; // End of class ProcessorAssignment
  };
};

#endif

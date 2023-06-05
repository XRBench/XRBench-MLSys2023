

#pragma once

#include <algorithm>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include <map>
#include <memory>
#include <vector>

#include "DFA_neural-network.hpp"

namespace maestro{
  namespace HET {
    class LoadGenerator {
      public:
        LoadGenerator(
            float max_jitter,
            std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::NeuralNetwork>>> workloads
        ):
          max_jitter_(max_jitter),
          workloads_(workloads) {

          // Random seed for modeling jitter
          std::srand(static_cast<unsigned int>(std::time(nullptr)));

          assert(workloads->size() > 0);
          num_models_ = workloads->size();

          for(auto it: *workloads) {
            int fps_target = it->GetFPS();
            inference_interval_.push_back(1000/fps_target); // Interval in ms
            dispatched_frame_ids_.push_back(-1);
          }
        }

        void Initialize(float ms_to_run) {
          for(int model_idx = 0; model_idx < num_models_; model_idx++) {
            // The unit of inference_interval_ is ms
            int num_total_requests = static_cast<int>(std::floor(ms_to_run / inference_interval_[model_idx]));
            num_inferences_each_model_.push_back(num_total_requests);
            // std::cout << "[Load Generator] Model " << model_idx << ", num_total_requests = " << num_total_requests << std::endl;
          }
        }

        std::shared_ptr<std::map<std::string, std::shared_ptr<InferenceRequest>>> GetNewInferenceRequests(float current_time) {
          auto ret = std::make_shared<std::map<std::string, std::shared_ptr<InferenceRequest>>>();

          for(int model_idx = 0; model_idx < num_models_; model_idx++) {
            float jitter_value = (GenerateRandomNumber() - 0.5) * this->max_jitter_;

            auto next_frame_injection_time = inference_interval_[model_idx] * (dispatched_frame_ids_[model_idx] + 1);
            // std::cout << "[Load Generator] Current time: " << current_time << std::endl;
            // std::cout << "[Load Generator] Next frame injection time for model " << model_idx << " : " << next_frame_injection_time << std::endl;
            if(next_frame_injection_time <= current_time) {

              if(dispatched_frame_ids_[model_idx] != num_inferences_each_model_[model_idx]-1) {
                // The deadline does not change based on the jitter
                float deadline = inference_interval_[model_idx] * (dispatched_frame_ids_[model_idx] + 2);
                auto model = workloads_->at(model_idx);
                dispatched_frame_ids_[model_idx] += 1;
                float inj_rand_num = GenerateRandomNumber();

                //std::cout << model->GetName() << ", model_prob = " << model->GetProb() << std::endl;
                //std::cout << "inj_rand_num = " << inj_rand_num << std::endl;
                if(model->GetProb() > inj_rand_num) {
                  auto new_inference_request = std::make_shared<InferenceRequest>(
                      dispatched_frame_ids_[model_idx],
                      current_time,
                      deadline,
                      jitter_value,
                      model
                  );
                  /*
                  std::cout << "[Load Generator] Load injection, Model " << model_idx
                    << ", frame_id : " <<  dispatched_frame_ids_[model_idx] << ", deadline: "
                    << deadline << std::endl;
                  */
                  // Add inference request
                  (*ret)[model->GetName()] = new_inference_request;
                }
              }
            }
          }

          return ret;
        }

        bool HasRemainingWorks(float current_time) {
          bool ret = false;

          // Check if any requests on at least one model is not yet dispatched
          for(int model_idx = 0; model_idx < num_models_; model_idx++) {
            assert(dispatched_frame_ids_[model_idx] <= num_inferences_each_model_[model_idx]-1);

            if(dispatched_frame_ids_[model_idx] < num_inferences_each_model_[model_idx]-1) {
              ret = true;
              break;
            }

          }
          return ret;
        }

      protected:
        float max_jitter_;
        int num_models_;
        std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::NeuralNetwork>>> workloads_;

        std::vector<int> num_inferences_each_model_;
        std::vector<int> dispatched_frame_ids_;
        std::vector<float> inference_interval_;

      private:
        float GenerateRandomNumber() {
          return ((float) std::rand()/RAND_MAX);
        }
    }; // End of class LoadGenerator

  };
};

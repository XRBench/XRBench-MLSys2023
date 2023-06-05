

#pragma once

#include <algorithm>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include <map>
#include <memory>
#include <vector>

#include "DFA_neural-network.hpp"
#include "HET_inference-request.hpp"
#include "HET_process.hpp"

namespace maestro{
  namespace HET {
    class Timer {
      public:
        Timer(
            float max_jitter,
            std::shared_ptr<std::vector<std::shared_ptr<DFA::NeuralNetwork>>> workloads,
            std::shared_ptr<std::vector<std::shared_ptr<InferenceProcess>>> active_job_queue
        ):
          max_jitter_(max_jitter),
          workloads_(workloads),
          active_job_queue_(active_job_queue) {

          assert(workloads->size() > 0);
          num_models_ = workloads->size();

          // Random seed for modeling jitter
          std::srand(static_cast<unsigned int>(std::time(nullptr)));

          base_fps_ = -1;
          for(auto it: *workloads) {
            int fps_target = it->GetFPS();
            base_fps_ = std::max(base_fps_, fps_target);
          }

          assert(base_fps_>0);

          base_tick_ = 1000/base_fps_; // time unit: ms

          current_time_ = 0;
          base_frame_ = 0;
        }

        float GetNextEventTime() {
          float next_bast_tick_time = (base_frame_+1) * base_tick_;
          float ret = next_bast_tick_time;
          /*
          std::cout << "[Timer] Current time: " << current_time_ << std::endl;
          std::cout << "[Timer] Next event time list" << std::endl;
          std::cout << "    - Next FPS tick: " << ret << std::endl;
          */
          // Check the active job queue
          int acc_id = 0;
          for(auto process: *active_job_queue_) {
            if(process != nullptr) {
              auto completion_time = process->GetCompletionTime();
              // std::cout << "    - Next completion time on accelerator " << acc_id << ": "  << completion_time << std::endl;
              ret = std::min(ret, completion_time);
            }
            acc_id++;
          }

          assert(current_time_ < ret);

          if(ret == next_bast_tick_time) {
            base_frame_++;
          }
          current_time_ = ret;

          // std::cout << "[Timer] Selected next event time:" << ret << std::endl;

          return ret;
        }

      protected:
        float max_jitter_;
        int num_models_;
        int base_fps_;
        float base_tick_;
        float current_time_;

        int base_frame_;

        std::shared_ptr<std::vector<std::shared_ptr<DFA::NeuralNetwork>>> workloads_;
        std::shared_ptr<std::vector<std::shared_ptr<InferenceProcess>>> active_job_queue_; // size: num_accs

      private:
        float GeneratorRandomNumber() {
          return ((float) std::rand()/RAND_MAX);
        }
    }; // End of class Timer

  }; // End of namespace HET
}; // End of namespace maestro

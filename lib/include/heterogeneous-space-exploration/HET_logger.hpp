

#pragma once

#include <algorithm>
#include <cmath>
#include <map>
#include <memory>
#include <limits>

#include "HET_cost-class.hpp"


namespace maestro{
  namespace HET {

    class InferenceLog {
      public:
        InferenceLog(
          std::string model_name,
          int input_frame_id,
          float injection_time,
          float dispatch_time,
          float deadline,
          float finish_time,
          double energy,
          bool is_dropped
        ) :
          model_name_(model_name),
          input_frame_id_(input_frame_id),
          injection_time_(injection_time),
          dispatch_time_(dispatch_time),
          deadline_(deadline),
          completion_time_(finish_time),
          energy_(energy),
          is_dropped_(is_dropped) {
        }

        float ComputeDelay() {
          if(!is_dropped_) {
            return (completion_time_ - deadline_);
          }
          else {
            return std::numeric_limits<float>::max();
          }
        }

        bool IsDropped() {
          return is_dropped_;
        }

        std::string GetModelName() {
          return model_name_;
        }

        double GetEnergy() {
          if(is_dropped_) {
            return 0.0;
          }
          else {
            return energy_;
          }
        }

        int GetFrameID() {
          return input_frame_id_;
        }

        float GetInjectionTime() {
          return injection_time_;
        }

        float GetDispatchTime() {
          return dispatch_time_;
        }

        float GetDeadline() {
          return deadline_;
        }

        float GetCompletionTime() {
          return completion_time_;
        }

      protected:
        std::string model_name_;
        int input_frame_id_;
        float injection_time_;
        float dispatch_time_;
        float deadline_;
        float completion_time_;
        double energy_;
        bool is_dropped_;
    };

    class Logger {
      public:
        Logger(int num_accelerators) :
          num_accelerators_(num_accelerators) {
          model_wise_log_ = std::make_shared<std::map< std::string, std::shared_ptr<std::vector<std::shared_ptr<InferenceLog>>>>>();
          model_list_ = std::make_shared<std::list<std::string>>();
          acc_wise_log_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<InferenceLog>>>>>();
          for(int acc_idx = 0; acc_idx < num_accelerators; acc_idx++) {
            auto acc_event_log = std::make_shared<std::vector<std::shared_ptr<InferenceLog>>>();
            acc_wise_log_->push_back(acc_event_log);
          }
        }

        void AddLog(
          int acc_id,
          std::string model_name,
          int input_frame_id,
          float injection_time,
          float dispatch_time,
          float deadline,
          float finish_time,
          float energy,
          bool is_dropped
        ) {
          auto new_log = std::make_shared<InferenceLog>(
            model_name,
            input_frame_id,
            injection_time,
            dispatch_time,
            deadline,
            finish_time,
            energy,
            is_dropped
          );

          //std::cout << "[Logger->AddLog] Generate a new log" << std::endl;
          // If logs of the model do not exist, create the log queue for the model
          if (model_wise_log_->find(model_name) == model_wise_log_->end()) {
            model_list_->push_back(model_name);
            (*model_wise_log_)[model_name] = std::make_shared<std::vector<std::shared_ptr<InferenceLog>>>();
            //std::cout << "[Logger->AddLog] Register model entry to model_wise_log_" << std::endl;
          }

          // Push the log back to the log queue of the model
          (*model_wise_log_)[model_name]->push_back(new_log);
          //std::cout << "[Logger->AddLog] Insert new log to the model_wise_log_" << std::endl;
          //std::cout << "AcceleratorID: " << acc_id << ", acc_wise_log size: " << acc_wise_log_->size() << std::endl;
          (*acc_wise_log_)[acc_id]->push_back(new_log);
          //std::cout << "[Logger->AddLog] Insert new log to the acc_wise_log_" << std::endl;
        }

        std::shared_ptr<std::vector<std::shared_ptr<InferenceLog>>> GetModelLog(std::string model_name) {
          if (model_wise_log_->find(model_name) != model_wise_log_->end()) {
            return model_wise_log_->at(model_name);
          }
          else {
            return nullptr;
          }
        }

        std::shared_ptr<std::list<std::string>> GetModelList() {
          return model_list_;
        }

        std::shared_ptr<std::vector<std::shared_ptr<InferenceLog>>> GetAccLog(int acc_id) {
          if(acc_id >= num_accelerators_) {
            return nullptr;
          }
          return acc_wise_log_->at(acc_id);
        }

      protected:
        int num_accelerators_;
        std::shared_ptr<std::list<std::string>> model_list_;
        std::shared_ptr<std::map<std::string, std::shared_ptr<std::vector<std::shared_ptr<InferenceLog>>>>> model_wise_log_;
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<InferenceLog>>>>> acc_wise_log_;
    }; // End of class Logger

  };
};

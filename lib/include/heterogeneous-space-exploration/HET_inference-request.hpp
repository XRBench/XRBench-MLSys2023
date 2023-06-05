

#ifndef MAESTRO_HET_INFERENCE_REQUEST_HPP_
#define MAESTRO_HET_INFERENCE_REQUEST_HPP_


#include <algorithm>
#include <cmath>
#include <memory>

#include "HET_cost-class.hpp"


namespace maestro{
  namespace HET {
    class InferenceRequest {
      public:
        InferenceRequest(
          int frame_id,
          float injection_time,
          float deadline,
          float jitter,
          std::shared_ptr<DFA::NeuralNetwork> model
        ):
          frame_id_(frame_id),
          injection_time_(injection_time),
          deadline_(deadline),
          jitter_(jitter),
          model_(model) {
        }

        bool HasInputData(float current_time) {
          return (injection_time_ <= current_time);
        }

        bool IsDropped(float current_time) {
          return (deadline_ < current_time);
        }

        bool IsDependent(std::shared_ptr<maestro::DFA::NeuralNetwork> targ_model) {
          return model_->CheckDependency(targ_model->GetName());
        }

        int GetFrameID() {
          return frame_id_;
        }

        std::string GetModelName() {
          return model_->GetName();
        }

        std::shared_ptr<std::vector<std::string>> GetDependencyList() {
          return model_->GetDependencyList();
        }

        float GetInjectionTime() {
          return injection_time_;
        }

        float GetDeadline() {
          return deadline_;
        }

        float GetJitter() {
          return jitter_;
        }

        std::shared_ptr<maestro::DFA::NeuralNetwork> GetModel() {
          return model_;
        }

      protected:
          int frame_id_;
          float injection_time_;
          float deadline_;
          float jitter_;
          std::shared_ptr<maestro::DFA::NeuralNetwork> model_;
    };

}; // End of namespace HET

}; // End of namespace maestro
#endif



#pragma once

#include <memory>

#include "HET_cost-class.hpp"
#include "HET_inference-request.hpp"

#define FP_ERROR_MARGIN 1e-2f

namespace maestro{
  namespace HET {
    class InferenceProcess {
      public:
        InferenceProcess(
          float dispatch_time,
          std::shared_ptr<::maestro::HET::InferenceRequest> inference_request
        ):
          dispatch_time_(dispatch_time),
          inference_request_(inference_request) {
          completeion_time_ = -1;
          energy_ = 0;
        }

        int GetFrameID() {
          return inference_request_->GetFrameID();
        }

        void SetLatency(float latency) {
          assert(latency > 0);
          completeion_time_ = dispatch_time_ + latency;
        }

        void SetEnergy(double energy) {
          energy_ = energy;
        }

        bool IsFinished(float current_time) {
          return current_time + FP_ERROR_MARGIN >= completeion_time_;
        }

        std::string GetModelName(){
          return inference_request_->GetModelName();
        }

        float GetInjectionTime() {
          return inference_request_->GetInjectionTime();
        }

        float GetDeadline() {
          return inference_request_->GetDeadline();
        }

        float GetCompletionTime() {
          return completeion_time_;
        }

        double GetEnergy() {
          return energy_;
        }

        float GetDispatchTime() {
          return dispatch_time_;
        }


      protected:
          float dispatch_time_;
          float completeion_time_;
          double energy_;
          std::shared_ptr<::maestro::HET::InferenceRequest> inference_request_;
    };

}; // End of namespace HET

}; // End of namespace maestro



#pragma once

#include <algorithm>
#include <cmath>
#include <map>
#include <memory>

#include "HET_logger.hpp"

//#define DEBUG_HET_SCORING_MODULE

namespace maestro{
  namespace HET {
    class ScoringModule {
      public:
        ScoringModule(
          float rt_score_param_k,
          float en_score_param_max_en
        ) :
          rt_score_param_k_(rt_score_param_k),
          en_score_param_max_en_(en_score_param_max_en),
          is_score_processed_(false) {

        }

        float ComputeScore(std::shared_ptr<HET::Logger> logger) {
          auto model_list = logger->GetModelList();
          auto num_models = model_list->size();

          auto modelwise_score = std::make_unique<std::vector<float>>(num_models);
          std::fill_n(modelwise_score->begin(), modelwise_score->size(), 0);

          std::map<std::string, int> num_dropped_frames;

          ux_scores_ = std::make_shared<std::map<std::string, float>>();
          rt_scores_ = std::make_shared<std::map<std::string, std::shared_ptr<std::vector<float>>>>();
          en_scores_ = std::make_shared<std::map<std::string, std::shared_ptr<std::vector<float>>>>();


          int model_idx = 0;
          for(auto model_name : *model_list) {
            auto model_log = logger->GetModelLog(model_name);
            num_dropped_frames[model_name] = 0;

            (*rt_scores_)[model_name] = std::make_shared<std::vector<float>>();
            (*en_scores_)[model_name] = std::make_shared<std::vector<float>>();

            for(auto log :*model_log) {
              if(log->IsDropped()) {
                num_dropped_frames[model_name] = num_dropped_frames[model_name] + 1;
              }
              else {
                auto rt_score = this->ComputeRealtimeScore(log);
                auto en_score = this->ComputeEnergyScore(log);

                (*rt_scores_)[model_name]->push_back(rt_score);
                (*en_scores_)[model_name]->push_back(en_score);

                modelwise_score->at(model_idx) += rt_score * en_score;
                #ifdef DEBUG_HET_SCORING_MODULE
                std::cout << "Model " << log->GetModelName()  << ", Inference score[" << log->GetFrameID() << "] = " << rt_score * en_score << std::endl;
                #endif
              }
            } // End of for(auto log :*model_log)
            model_idx++;
          } // End of for(auto model_name : *model_list)

          float overall_score = 0;

          model_idx = 0;
          for(auto model_name : *model_list) {
            auto model_log = logger->GetModelLog(model_name);

            float frame_drop_rate;
            if(model_log->size() != 0) {
              frame_drop_rate = static_cast<float>(num_dropped_frames[model_name]) / static_cast<float>(model_log->size());
            }
            else {
              frame_drop_rate = 1;
            }
            #ifdef DEBUG_HET_SCORING_MODULE
            std::cout << "Model " << model_name << ", frame drop rate = " << frame_drop_rate << std::endl;
            #endif
            float ux_score = (1-frame_drop_rate);

            (*ux_scores_)[model_name] = ux_score;

            overall_score += (modelwise_score->at(model_idx)/model_log->size()) * ux_score;
            model_idx++;
          }

          overall_score /= num_models;
          overall_score *= 100;

          is_score_processed_ = true;
          return overall_score;
        }

        std::shared_ptr<std::map<std::string, std::shared_ptr<std::vector<float>>>> GetRealTimeScores() {
          if(is_score_processed_) {
            return rt_scores_;
          }
          else {
            return nullptr;
          }
        }

        std::shared_ptr<std::map<std::string, std::shared_ptr<std::vector<float>>>> GetEnergyScores() {
          if(is_score_processed_) {
            return en_scores_;
          }
          else {
            return nullptr;
          }
        }

        std::shared_ptr<std::map<std::string, float>> GetUserExperienceScores() {
          if(is_score_processed_) {
            return ux_scores_;
          }
          else {
            return nullptr;
          }
        }

      protected:
        bool is_score_processed_;
        float rt_score_param_k_;
        float en_score_param_max_en_;

        float max_jitter_;
        int base_fps_;
        float tick_;
        float current_time_;
        std::shared_ptr<std::vector<int>> num_runs_within_base_fps_;
        std::shared_ptr<ConvCostClass> cost_class_;
        std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::NeuralNetwork>>> workloads_;
        std::shared_ptr<std::map<std::string, std::shared_ptr<std::vector<float>>>> rt_scores_;
        std::shared_ptr<std::map<std::string, std::shared_ptr<std::vector<float>>>> en_scores_;
        std::shared_ptr<std::map<std::string, float>> ux_scores_;
      private:
        float ComputeRealtimeScore(
          std::shared_ptr<HET::InferenceLog> inference_log
        ) {
          auto delay = inference_log->ComputeDelay();
          auto score = 1 / (1 + std::exp(rt_score_param_k_ * delay));

          return score;
        }

        float ComputeEnergyScore(
          std::shared_ptr<HET::InferenceLog> inference_log
        ) {

          auto score = (en_score_param_max_en_-inference_log->GetEnergy()) / en_score_param_max_en_;
          return score;
        }
    }; // End of class ScoringModule

  };
};

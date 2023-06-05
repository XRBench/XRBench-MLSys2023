

#pragma once

#include <algorithm>
#include <cmath>
#include <map>
#include <memory>
#include <vector>

#include "HET_cost-class.hpp"
#include "TL_generic-csv-writer.hpp"

namespace maestro{
  namespace HET {

    class SummaryGenerator {
      public:
        SummaryGenerator(std::string output_file_name) {
          csv_writer_ = std::make_unique<TL::GenericCSVWriter>(output_file_name);
          // Write headers
          csv_writer_->WriteWord("Model Name");
          csv_writer_->WriteWord("Real-time Score");
          csv_writer_->WriteWord("Energy Score");
          csv_writer_->WriteWord("User-Experience Score", true);
        }

        void WriteSummary(
          std::shared_ptr<std::map<std::string, std::shared_ptr<std::vector<float>>>> rt_scores,
          std::shared_ptr<std::map<std::string, std::shared_ptr<std::vector<float>>>> en_scores,
          std::shared_ptr<std::map<std::string, float>> ux_scores
        ) {
          for(auto it: *rt_scores) {
            auto model_name = it.first;
            auto rt_scores_logs = it.second;
            auto en_scores_logs = (*en_scores)[model_name];
            auto ux_score_this_model = (*ux_scores)[model_name];

            double rt_scores_sum = 0;
            double en_scores_sum = 0;
            int num_logs_this_model = rt_scores_logs->size();
            for(int log_idx = 0; log_idx < num_logs_this_model; log_idx++) {
              //std::cout << "[" << model_name << "] rt_scores_sum: " << rt_scores_sum << std::endl;
              rt_scores_sum += (*rt_scores_logs)[log_idx];
              en_scores_sum += (*en_scores_logs)[log_idx];
            }

            double avg_rt_scores;
            double avg_en_scores;
            if(num_logs_this_model != 0) {
              avg_rt_scores = rt_scores_sum/static_cast<double>(num_logs_this_model);
              avg_en_scores = en_scores_sum/static_cast<double>(num_logs_this_model);
            }
            else {
              avg_rt_scores = 0;
              avg_en_scores = 0;
            }

            csv_writer_->WriteWord(model_name);
            csv_writer_->WriteWord(std::to_string(avg_rt_scores));
            csv_writer_->WriteWord(std::to_string(avg_en_scores));
            csv_writer_->WriteWord(std::to_string(ux_score_this_model), true);
          }

        }

        void WriteOverallScore(float score) {
          csv_writer_->WriteWord("Overall Score");
          csv_writer_->WriteWord(std::to_string(score),true);
        }

      protected:
        std::unique_ptr<TL::GenericCSVWriter> csv_writer_;

    }; // End of class TimelineExtractor

  };  // End of namespace HET
}; // End of namespace maestro

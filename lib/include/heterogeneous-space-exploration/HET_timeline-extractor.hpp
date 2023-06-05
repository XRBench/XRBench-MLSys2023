

#pragma once

#include <algorithm>
#include <cmath>
#include <map>
#include <memory>
#include <limits>

#include "HET_cost-class.hpp"
#include "TL_generic-csv-writer.hpp"

namespace maestro{
  namespace HET {

    class TimelineExtractor {
      public:
        TimelineExtractor(std::string output_file_name) {
          csv_writer_ = std::make_unique<TL::GenericCSVWriter>(output_file_name);
          // Write headers
          csv_writer_->WriteWord("AcceleratorID");
          csv_writer_->WriteWord("Model Name");
          csv_writer_->WriteWord("Frame ID");
          csv_writer_->WriteWord("Injection Time (ms)");
          csv_writer_->WriteWord("Dispatch Time (ms)");
          csv_writer_->WriteWord("Deadline Time (ms)");
          csv_writer_->WriteWord("Completion Time (ms)");
          csv_writer_->WriteWord("Violated Deadline Amount (ms)");
          csv_writer_->WriteWord("Energy (mJ)", true);
        }

        void ExtractTimeline(int acc_id, std::shared_ptr<std::vector<std::shared_ptr<InferenceLog>>> acc_logs) {
          for(auto log : *acc_logs) {
            if(!log->IsDropped()) {
              csv_writer_->WriteWord(std::to_string(acc_id));
              csv_writer_->WriteWord(log->GetModelName());
              csv_writer_->WriteWord(std::to_string(log->GetFrameID()));
              csv_writer_->WriteWord(std::to_string(log->GetInjectionTime()));
              csv_writer_->WriteWord(std::to_string(log->GetDispatchTime()));
              csv_writer_->WriteWord(std::to_string(log->GetDeadline()));
              csv_writer_->WriteWord(std::to_string(log->GetCompletionTime()));
              csv_writer_->WriteWord(std::to_string(log->GetCompletionTime() - log->GetDeadline()));
              csv_writer_->WriteWord(std::to_string(log->GetEnergy()), true);
            }
          }
        }

      protected:
        std::unique_ptr<TL::GenericCSVWriter> csv_writer_;

    }; // End of class TimelineExtractor

  };  // End of namespace HET
}; // End of namespace maestro

#ifndef MAESTRO_INTEGRATED_PARSERS_
#define MAESTRO_INTEGRATED_PARSERS_

#include <memory>


#include "DFSL_parser.hpp"

namespace maestro {
  namespace HET {
    class IntegratedParsers {
      public:
        IntegratedParsers(
            std::string model_file_name,
            std::string dataflow_file_name) {
          model_parser_= std::make_shared<maestro::DFSL::ModelParser>(model_file_name);
          dataflow_parser_ = std::make_shared<maestro::DFSL::DataflowParser>(dataflow_file_name);

          models_ = model_parser_->ParseModel();
          dataflows_ = dataflow_parser_->ParseDataflow();
        }

        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::Layer>>>>> GetModels() {
          return models_;
        }

        std::shared_ptr<std::vector<std::shared_ptr<DFA::DirectiveTable>>> GetDataflows() {
          return dataflows_;
        }

      protected:
        std::shared_ptr<DFSL::ModelParser> model_parser_;
        std::shared_ptr<DFSL::DataflowParser> dataflow_parser_;

        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::Layer>>>>> models_;
        std::shared_ptr<std::vector<std::shared_ptr<DFA::DirectiveTable>>> dataflows_;

      private:

    }; // End of class IntegratedParsers

  }; // End of namespace HET
}; // End of namespace maestro



#endif

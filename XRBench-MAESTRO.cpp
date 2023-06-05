/******************************************************************************
MAESTRO:

Copyright (c) 2019 Georgia Instititue of Technology

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Author : Hyoukjun Kwon (hyoukjun@gatech.edu)

XRBench: MIT license
*******************************************************************************/

#include <ctime>
#include <cstdlib>

#include <iostream>
#include <memory>
#include <vector>
#include <list>

#include <boost/program_options.hpp>

#include "BASE_constants.hpp"
#include "BASE_base-objects.hpp"
#include "option.hpp"

#include "DFSL_parser.hpp"
#include "DFSL_hw_parser.hpp"

#include "DFA_layer.hpp"
#include "DFA_neural-network.hpp"
#include "DFA_tensor.hpp"
#include "DFA_directive-table.hpp"

#include "AHW-noc-model.hpp"

#include "CA_cost-analysis-results.hpp"

#include "API_configuration.hpp"
#include "API_user-interface.hpp"

#include "DSE_cost-database.hpp"
#include "DSE_design_point.hpp"
#include "DSE_hardware_modules.hpp"
#include "DSE_csv_writer.hpp"

#include "HET_keywords.hpp"

#include "HET_stateful-cost-function.hpp"

#include "HET_cost-class.hpp"

#include "TL_generic-csv-writer.hpp"

#include "HET_runtime.hpp"
#include "HET_logger.hpp"
#include "HET_timeline-extractor.hpp"
#include "HET_summary-generator.hpp"

int main(int argc, char** argv)
{
  maestro::Options option;
  bool success = option.parse(argc, argv);

  if(!success) {
    std::cout << "[MAESTRO] Failed to parse program options" << std::endl;
  }

  maestro::InitializeBaseObjects();

  std::shared_ptr<std::vector<int>> num_simd_units = std::make_shared<std::vector<int>>();
  std::shared_ptr<std::vector<int>> num_pe_cycles = std::make_shared<std::vector<int>>();
  std::shared_ptr<std::vector<std::shared_ptr<std::vector<int>>>> noc_bw = std::make_shared<std::vector<std::shared_ptr<std::vector<int>>>>();

  // Parse input files

  std::shared_ptr<maestro::DFSL::ModelParser> model_parser = std::make_shared<maestro::DFSL::ModelParser>(option.model_file_name);
  std::shared_ptr<maestro::DFSL::DataflowParser> dataflow_parser = std::make_shared<maestro::DFSL::DataflowParser>(option.dataflow_file_name);
  std::shared_ptr<maestro::DFSL::HWParser> hw_parser = std::make_shared<maestro::DFSL::HWParser>(option.hw_file_name);


  // Parse HW information
  auto hw_config = hw_parser->ParseHW();
  auto num_accs = hw_config->size();
  auto num_pes = std::make_shared<std::vector<int>>();

  // Parse workload (models) information
  auto models_network_granularity = model_parser->ParseModel();
  auto models = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::Layer>>>>>();

  for(auto m : *models_network_granularity) {
    models->push_back(m->GetLayerList());
  }

  // Parse accelerator dataflow
  auto dataflows = dataflow_parser->ParseDataflow();


  // Construct data structures for each information
  int num_models = models->size();
  int num_procs = dataflows->size();

  for(auto it : *hw_config) {
    int num_levels = it->noc_bandwidth.size();
    num_pes->push_back(it->num_pes);
    // num_simd_units and num_pe_cycles: Apply default settings of MAESTRO
    num_simd_units->push_back(1);
    num_pe_cycles->push_back(1);
    it->noc_bandwidth.push_back(it->noc_bandwidth[num_levels-1]);
    it->noc_bandwidth.push_back(it->noc_bandwidth[num_levels-1]);
    it->noc_bandwidth.push_back(it->noc_bandwidth[num_levels-1]);

    auto this_proc_noc_bw = std::make_shared<std::vector<int>>(it->noc_bandwidth);
    noc_bw->push_back(this_proc_noc_bw);
  }

  // Define CONV2D op for MAESTRO
  auto overlap_dim_list = std::make_shared<std::list<std::shared_ptr<std::pair<std::string, std::string>>>>();
  auto output_column_overlap = std::make_shared<std::pair<std::string, std::string>>("X", "S");
  auto output_row_overlap = std::make_shared<std::pair<std::string, std::string>>("Y", "R");
  overlap_dim_list->push_back(output_column_overlap);
  overlap_dim_list->push_back(output_row_overlap);

  auto cost_class = std::make_shared<maestro::HET::ConvCostClass>(
    num_procs,
    num_models,
    num_pes,
    num_simd_units,
    num_pe_cycles,
    models,
    overlap_dim_list,
    dataflows
  );

  std::list<std::string> input_coupled_vars = {"C", "Y", "X"};

  std::list<std::string> weight_coupled_vars_dw = {"K", "C", "R", "S"};
  std::list<std::string> output_coupled_vars_dw = {"C", "Y", "X"};

  std::list<std::string> weight_coupled_vars = {"K", "C", "R", "S"};
  std::list<std::string> output_coupled_vars = {"K", "Y", "X"};

  cost_class->AddTensor("input", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Input, input_coupled_vars);
  cost_class->AddTensor("weight", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Weight, weight_coupled_vars);
  cost_class->AddTensor("output", maestro::DFA::TensorClass::OutputTensor, maestro::DataClass::Output, output_coupled_vars);

  cost_class->AddTensor("input", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Input, input_coupled_vars, true);
  cost_class->AddTensor("weight", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Weight, weight_coupled_vars_dw, true);
  cost_class->AddTensor("output", maestro::DFA::TensorClass::OutputTensor, maestro::DataClass::Output, output_coupled_vars_dw, true);


  // Proc: accelerator in the current version.
  // Used "Proc" based on future dev plans (more general HW backend support)
  for(int proc_id = 0; proc_id < num_procs; proc_id++) {
    std::shared_ptr<std::vector<int>> noc_bw_proc;
    if(proc_id < noc_bw->size()) {
      noc_bw_proc = noc_bw->at(proc_id);
    }
    else {
      noc_bw_proc = noc_bw->at(noc_bw->size() - 1);
    }

    for(auto& bw: *noc_bw_proc) {
      cost_class->AddNoC(bw,1,1,true,proc_id);
    }
  }

  // Generate base cost database for every single case
  // (i.e., which model goes to which accelerator)
  cost_class->ProcessCost();


  // XRBench v0.1 default parameters
  float max_jitter = 0.01; // 0.01 ms
  float rt_score_param_k = 15;
  float en_score_param_max_en = 1500;

  auto logger = std::make_shared<maestro::HET::Logger>(num_accs);
  auto scoring_module = std::make_shared<maestro::HET::ScoringModule>(rt_score_param_k, en_score_param_max_en);

  auto XRBench_runtime = std::make_shared<maestro::HET::Runtime>(
    max_jitter,
    maestro::HET::ProcessorAssignmentStrategy::LatencyGreedy,
    models_network_granularity,
    cost_class,
    logger,
    scoring_module
  );

  XRBench_runtime->RunWorkloads(700);

  float score = XRBench_runtime->GetScore();

  std::cout << "Score: " << score << std::endl;

  auto timeline_extractor = std::make_unique<maestro::HET::TimelineExtractor>(option.XRBench_timeline_output_file_name);

  for(auto acc_idx = 0; acc_idx < num_accs; acc_idx++) {
    auto acc_log = logger->GetAccLog(acc_idx);
    timeline_extractor->ExtractTimeline(acc_idx, acc_log);
  }

  auto rt_scores = scoring_module->GetRealTimeScores();
  auto en_scores = scoring_module->GetEnergyScores();
  auto ux_scores = scoring_module->GetUserExperienceScores();

  assert(rt_scores != nullptr);
  assert(en_scores != nullptr);
  assert(ux_scores != nullptr);

  auto summary_generator = std::make_unique<maestro::HET::SummaryGenerator>(option.XRBench_summary_output_file_name);

  summary_generator->WriteSummary(
    rt_scores,
    en_scores,
    ux_scores
  );

  summary_generator->WriteOverallScore(score);

  return 0;
}

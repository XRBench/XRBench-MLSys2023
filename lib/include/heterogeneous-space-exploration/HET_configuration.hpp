/*
 * This file is developed in Facebook as an internship project.
 * author: Hyoukjun Kwon (hyoukjunkwon@fb.com)
 * manager: Liangzhen Lai and Vikas Chandra
 */

#ifndef HET_CONFIGURATION_HPP_
#define HET_CONFIGURATION_HPP_

#include <string>
#include <memory>

#include "DFA_cluster-unit.hpp"
#include "DFA_cluster-table.hpp"

#include "DFA_directive-table.hpp"

#include "API_configuration.hpp"

#include "HET_schedule.hpp"

#include "HET_proccessor-assignment-engine.hpp"
#include "HET_task-ordering-engine.hpp"
#include "HET_time-alignment-engine.hpp"



namespace maestro {
  namespace HET {


    enum class PEPartitioningStrategy {BruteForce, Uniform, NumPEPartitioningStrategies};
    enum class BWPartitioningStrategy {BruteForce, Uniform, NumBWPartitioningStrategies};

    class HetArchSearchConfig {
      public:
        std::string model_file_name_;
        std::string dataflow_file_name_;

        int num_procs_;
        int total_num_pes_;
        int pe_search_granul_;
        int total_bw_;
        int bw_search_granul_;

        int buffer_sz_;

        std::shared_ptr<std::vector<int>> num_simd_units_;
        std::shared_ptr<std::vector<int>> num_pe_cycles_;
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<int>>>> noc_bandwidth_;

        BWPartitioningStrategy bw_partitioning_strategy_;
        PEPartitioningStrategy pe_partitioning_strategy_;

        ProcessorAssignmentStrategy proc_assignment_strategy_;
        TaskOrderingStrategy task_ordering_strategy_;
        TimeAlignmentStrategy alignment_strategy_;
        int sched_lookahead_depth_ = 10;

        HetArchSearchConfig(
            std::string model_file_name,
            std::string dataflow_file_name,
            int num_procs,
            int total_num_pes,
            int pe_search_granul,
            int total_bw,
            int bw_search_granul,
            int avg_noc_latency,
            std::shared_ptr<std::vector<int>> num_simd_units,
            std::shared_ptr<std::vector<int>> num_pe_cycles,
            std::shared_ptr<std::vector<std::shared_ptr<std::vector<int>>>> noc_bandwidth,
            ProcessorAssignmentStrategy proc_assignment_strategy,
            TaskOrderingStrategy task_ordering_strategy,
            TimeAlignmentStrategy alignment_strategy,
            int l2_buffer_sz,
            int sched_lookahead_depth = 10) :
              model_file_name_(model_file_name),
              dataflow_file_name_(dataflow_file_name),
              num_procs_(num_procs),
              total_num_pes_(total_num_pes),
              pe_search_granul_(pe_search_granul),
              total_bw_(total_bw),
              bw_search_granul_(bw_search_granul),
              num_simd_units_(num_simd_units),
              num_pe_cycles_(num_pe_cycles),
              noc_bandwidth_(noc_bandwidth),
              proc_assignment_strategy_(proc_assignment_strategy),
              task_ordering_strategy_(task_ordering_strategy),
              alignment_strategy_(alignment_strategy),
              buffer_sz_(l2_buffer_sz * 1024 * 1024), //Unit conversion to MiB
              sched_lookahead_depth_(sched_lookahead_depth),
              bw_partitioning_strategy_(BWPartitioningStrategy::BruteForce),
              pe_partitioning_strategy_(PEPartitioningStrategy::BruteForce) {
        }

        HetArchSearchConfig(
            std::string model_file_name,
            std::string dataflow_file_name,
            int num_procs,
            int total_num_pes,
            int pe_search_granul,
            int total_bw,
            int bw_search_granul,
            int avg_noc_latency,
            std::shared_ptr<std::vector<int>> num_simd_units,
            std::shared_ptr<std::vector<int>> num_pe_cycles,
            std::shared_ptr<std::vector<std::shared_ptr<std::vector<int>>>> noc_bandwidth,
            ProcessorAssignmentStrategy proc_assignment_strategy,
            TaskOrderingStrategy task_ordering_strategy,
            TimeAlignmentStrategy alignment_strategy,
            int l2_buffer_sz,
            int sched_lookahead_depth = 10,
            BWPartitioningStrategy bw_partitioning_strategy = BWPartitioningStrategy::BruteForce,
            PEPartitioningStrategy pe_partitioning_strategy = PEPartitioningStrategy::BruteForce
            ) :
              model_file_name_(model_file_name),
              dataflow_file_name_(dataflow_file_name),
              num_procs_(num_procs),
              total_num_pes_(total_num_pes),
              pe_search_granul_(pe_search_granul),
              total_bw_(total_bw),
              bw_search_granul_(bw_search_granul),
              num_simd_units_(num_simd_units),
              num_pe_cycles_(num_pe_cycles),
              noc_bandwidth_(noc_bandwidth),
              proc_assignment_strategy_(proc_assignment_strategy),
              task_ordering_strategy_(task_ordering_strategy),
              alignment_strategy_(alignment_strategy),
              buffer_sz_(l2_buffer_sz * 1024 * 1024), //Unit conversion to MiB
              sched_lookahead_depth_(sched_lookahead_depth),
              bw_partitioning_strategy_(bw_partitioning_strategy),
              pe_partitioning_strategy_(pe_partitioning_strategy) {
        }

        //Copy constructor
        HetArchSearchConfig(std::shared_ptr<HetArchSearchConfig> copy_src) {
          model_file_name_ = copy_src->model_file_name_;
          dataflow_file_name_ =  copy_src->dataflow_file_name_;
          num_procs_ = copy_src->num_procs_;
          total_num_pes_ = copy_src->total_num_pes_;
          pe_search_granul_ = copy_src->pe_search_granul_;
          total_bw_ = copy_src->total_bw_;
          bw_search_granul_ = copy_src->bw_search_granul_;

          buffer_sz_ = copy_src->buffer_sz_;
          num_simd_units_ = std::make_shared<std::vector<int>>(*(copy_src->num_simd_units_));
          num_pe_cycles_ = std::make_shared<std::vector<int>>(*(copy_src->num_pe_cycles_));
          noc_bandwidth_ = std::make_shared<std::vector<std::shared_ptr<std::vector<int>>>>(); // Will not copy this!
          proc_assignment_strategy_ = copy_src->proc_assignment_strategy_;
          task_ordering_strategy_ = copy_src->task_ordering_strategy_;
          alignment_strategy_ = copy_src->alignment_strategy_;
          sched_lookahead_depth_ = copy_src->sched_lookahead_depth_;
          bw_partitioning_strategy_ = copy_src->bw_partitioning_strategy_;
          pe_partitioning_strategy_ = copy_src->pe_partitioning_strategy_;
        }


        /*
        auto maestro_config = std::make_shared<maestro::Configuration>(num_pes, option.num_alus_per_pe, bw, option.l1_size, option.l2_size);
        auto maestro_api = std::make_shared<maestro::API>(maestro_config);
        */

        void AddDataflow(std::shared_ptr<DFA::ClusterTable> new_dataflow) {
          dataflows_.push_back(new_dataflow);
        }

        void FlushDataflow() {
          dataflows_.clear();
        }

        int GetNumDataflows() {
          return dataflows_.size();
        }

      private:

        std::vector<std::shared_ptr<DFA::ClusterTable>> dataflows_;


    }; // End of class HetArchSearchConfig

  } // End of namespace HET
}  // End of namespace maestro

#endif

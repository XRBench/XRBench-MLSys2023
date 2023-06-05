#ifndef MAESTRO_HET_COST_CLASS_HPP_
#define MAESTRO_HET_COST_CLASS_HPP_

// #define DEBUG_HET_COST_CLASS_HPP_


#include <iostream>
#include <memory>
#include <vector>
#include <list>

#include "BASE_constants.hpp"
#include "BASE_base-objects.hpp"

#include "DFA_neural-network.hpp"
#include "DFA_tensor.hpp"

#include "AHW-noc-model.hpp"

#include "CA_cost-analysis-results.hpp"

#include "DSE_cost-database.hpp"
#include "DSE_design_point.hpp"
#include "DSE_hardware_modules.hpp"

#include "HET_task.hpp"


namespace maestro{
  namespace HET {

    template<class TaskClass>
    class CostClass {
      public:

        virtual long GetLatency(int proc_id, int model_id, int layer_id) = 0;
        virtual double GetEnergy(int proc_id, int model_id, int layer_id) = 0;

        virtual std::shared_ptr<TaskInfo<TaskClass>> GetTaskInfo(int model_id, int layer_id) {
          return nullptr;
        }

        virtual int GetNumProcs() = 0;
        virtual int GetNumModels() = 0;
        virtual int GetNumLayers(int model_id) = 0;

      protected:

      private:

    }; // End of class CostClass


    class ConvCostClass : public CostClass<DFA::Layer> {
      public:
        ConvCostClass(
            int num_procs,
            int num_models,
            std::shared_ptr<std::vector<int>> num_pes,
            std::shared_ptr<std::vector<int>> num_simd_units,
            std::shared_ptr<std::vector<int>> num_pe_cycles,
            std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<DFA::Layer>>>>> networks,
            std::shared_ptr<std::list<std::shared_ptr<std::pair<std::string, std::string>>>> overlap_dim_list,
            std::shared_ptr<std::vector<std::shared_ptr<DFA::DirectiveTable>>> dataflows) :
              CostClass(),
              num_procs_(num_procs),
              num_models_(num_models),
              networks_(networks),
              overlap_dim_list_(overlap_dim_list),
              num_pes_(num_pes),
              num_pe_cycles_(num_pe_cycles),
              num_simd_units_(num_simd_units),
              dataflows_(dataflows) {

          tensors_ = std::make_shared<DFA::TensorTable>();
          tensors_dw_ = std::make_shared<DFA::TensorTable>();

          /* Dimensions */
          // nocs_[proc][cluter_lv]
          nocs_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<AHW::NetworkOnChipModel>>>>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            auto proc_noc_info = std::make_shared<std::vector<std::shared_ptr<AHW::NetworkOnChipModel>>>();
            nocs_->push_back(proc_noc_info);
          }

          // cluster_analysis_[proc][model][layer]
          cluster_analysis_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<DFA::ClusterAnalysis>>>>>>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            auto proc_cluster_analysis = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<DFA::ClusterAnalysis>>>>>();

            for(int model_id = 0; model_id < num_models; model_id++) {
              auto model_cluster_analysis = std::make_shared<std::vector<std::shared_ptr<DFA::ClusterAnalysis>>>();
              proc_cluster_analysis->push_back(model_cluster_analysis);
            }
            cluster_analysis_->push_back(proc_cluster_analysis);
          }

          // analysis_results_[proc][model][layer][clsuter_lv]
          analysis_results_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<CA::CostAnalyisResults>>>>>>>>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            auto proc_analysis_results = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<CA::CostAnalyisResults>>>>>>>();

            for(int model_id = 0; model_id < num_models; model_id++) {
              auto model_analysis_results = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<CA::CostAnalyisResults>>>>>();
              int num_layers = networks->at(model_id)->size();

              proc_analysis_results->push_back(model_analysis_results);
            }

            analysis_results_->push_back(proc_analysis_results);
          }


          latency_database_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<long>>>>>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            auto proc_latency_base_vector = std::make_shared<std::vector<std::shared_ptr<std::vector<long>>>>();

            for(int model_id = 0; model_id < num_models; model_id++) {
              auto model_latency_base_vector = std::make_shared<std::vector<long>>();
              proc_latency_base_vector->push_back(model_latency_base_vector);
            }
            latency_database_->push_back(proc_latency_base_vector);
          }


          // energy_database_[proc][model][layer]
          energy_database_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<double>>>>>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            auto proc_energy_base_vector = std::make_shared<std::vector<std::shared_ptr<std::vector<double>>>>();

            for(int model_id = 0; model_id < num_models; model_id++) {
              auto model_energy_base_vector = std::make_shared<std::vector<double>>();
              proc_energy_base_vector->push_back(model_energy_base_vector);
            }
            energy_database_->push_back(proc_energy_base_vector);
          }

          // buffer_req_database_[proc][model][layer]
          buffer_req_database_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<long>>>>>>();
          for(int proc_id = 0; proc_id < num_procs; proc_id++) {
            auto proc_buffer_req_base_vector = std::make_shared<std::vector<std::shared_ptr<std::vector<long>>>>();

            for(int model_id = 0; model_id < num_models; model_id++) {
              auto buffer_req_base_vector = std::make_shared<std::vector<long>>();
              proc_buffer_req_base_vector->push_back(buffer_req_base_vector);
            }
            buffer_req_database_->push_back(proc_buffer_req_base_vector);
          }


        } // End of constructor

        void AddTensor(std::string tensor_name,
                       DFA::TensorClass tensor_class,
                       DataClass data_class,
                       std::list<std::string>& coupled_vars,
                       bool is_dw_conv = false) {
          std::shared_ptr<std::list<std::string>> coupled_vars_to_be_added = std::make_shared<std::list<std::string>>();

          for(auto var : coupled_vars) {
            coupled_vars_to_be_added->push_back(var);
          }

          std::shared_ptr<DFA::Tensor> new_tensor = std::make_shared<DFA::Tensor>(tensor_name, tensor_class, data_class, coupled_vars_to_be_added);
          if(!is_dw_conv) {
            tensors_->AddTensor(new_tensor);
          }
          else {
            tensors_dw_->AddTensor(new_tensor);
          }
        }


        //From top cluster (global buffer side) to lower cluster (PE side)
        void AddNoC(int bandwidth, int hops, int hop_latency, bool multicast_support, int proc_id ) {
          auto noc = std::make_shared<maestro::AHW::NetworkOnChipModel>(bandwidth, hops, hop_latency, multicast_support);
          nocs_->at(proc_id)->push_back(noc);
        }

        void ProcessCost() {
          AnalyzeClusters();
          AnalyzeCosts();
          ProcessCostInfo();
        }

        std::shared_ptr<TaskInfo<DFA::Layer>> GetTaskInfo(int model_id, int layer_id) {
          auto targ_layer = networks_->at(model_id)->at(layer_id);
          std::shared_ptr<std::vector<int>> task_id_vector = std::make_shared<std::vector<int>>();
          task_id_vector->push_back(model_id);
          task_id_vector->push_back(layer_id);

          auto ret = std::make_shared<TaskInfo<DFA::Layer>>(targ_layer, task_id_vector);

          return ret;
        }

        long GetLatency(int proc_id, int model_id, int layer_id) {
          if(proc_id < latency_database_->size()
              && model_id < latency_database_->at(proc_id)->size()
              && layer_id < latency_database_->at(proc_id)->at(model_id)->size()) {
            return latency_database_->at(proc_id)->at(model_id)->at(layer_id);
          }
          else {
            return -1;
          }
        }

        double GetEnergy(int proc_id, int model_id, int layer_id) {
          double ret = -1;
          if(proc_id < energy_database_->size()
              && model_id < energy_database_->at(proc_id)->size()
              && layer_id < energy_database_->at(proc_id)->at(model_id)->size()) {
            ret = energy_database_->at(proc_id)->at(model_id)->at(layer_id);
          }

          return ret;

        }

        int GetBufferReq(int proc_id, int model_id, int layer_id) {
          int ret = -1;
          if(proc_id < energy_database_->size()
              && model_id < energy_database_->at(proc_id)->size()
              && layer_id < energy_database_->at(proc_id)->at(model_id)->size()) {
            ret = buffer_req_database_->at(proc_id)->at(model_id)->at(layer_id);
          }

          return ret;
        }

        int GetNumProcs() {
          return num_procs_;
        }

        int GetNumModels() {
          return num_models_;
        }

        int GetNumLayers(int model_id) {
          return networks_->at(model_id)->size();
        }

        void PrintLatency() {
          int proc_id = 0;
          int model_id = 0;
          int layer_id = 0;
          for(auto& proc_dim : *latency_database_) {
            model_id = 0;
            for(auto& model_dim : *proc_dim) {
              layer_id = 0;
              long total_model_latency = 0;
              for(auto& layer_res : *model_dim) {
#ifdef DEBUG_HET_COST_CLASS_HPP_                
                std::cout << "(Pid = " << proc_id << ", model_id = " << model_id << ", " << layer_id << ") latency res: " << layer_res << std::endl;
#endif
                layer_id++;
                total_model_latency += layer_res;
              }
#ifdef DEBUG_HET_COST_CLASS_HPP_
              std::cout << "(Pid = " << proc_id << ", model_id = " << model_id << ") total latency: " << total_model_latency << std::endl;
#endif
              model_id++;
            }
            proc_id++;
          }
        }

        void PrintEnergy() {
          int proc_id = 0;
          int model_id = 0;
          int layer_id = 0;
          for(auto& proc_dim : *energy_database_) {
            model_id = 0;
            for(auto& model_dim : *proc_dim) {
              layer_id = 0;
              for(auto& layer_res : *model_dim) {
#ifdef DEBUG_HET_COST_CLASS_HPP_
                std::cout << "(Pid = " << proc_id << ", model_id = " << model_id << ", " << layer_id << ") energy res: " << layer_res << std::endl;
#endif
                layer_id++;
              }
              model_id++;
            }
            proc_id++;
          }
        }

      protected:
        int num_procs_ = 1;
        int num_models_ = 1;
        std::shared_ptr<DFA::TensorTable> tensors_;
        std::shared_ptr<DFA::TensorTable> tensors_dw_;
        std::shared_ptr<std::list<std::shared_ptr<std::pair<std::string, std::string>>>> overlap_dim_list_;

        /* Input information for analysis */
        // nocs_[proc][cluter_lv]
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<AHW::NetworkOnChipModel>>>>> nocs_;
        // num_pes_[proc]
        std::shared_ptr<std::vector<int>> num_pes_;
        // num_simd_units_[proc]
        std::shared_ptr<std::vector<int>> num_simd_units_;
        // num_pe_cycle_[proc]
        std::shared_ptr<std::vector<int>> num_pe_cycles_;
        // cluster_analysis_[proc][model][layer]
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<DFA::ClusterAnalysis>>>>>>> cluster_analysis_;
        // dataflows_[proc]
        std::shared_ptr<std::vector<std::shared_ptr<DFA::DirectiveTable>>> dataflows_;
        // networks[model][layer]
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<DFA::Layer>>>>> networks_;

        /* Output analysis results */
        // analysis_results_[proc][model][layer][clsuter_lv]
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<CA::CostAnalyisResults>>>>>>>>> analysis_results_;
        // latency_database_[proc][model][layer]
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<long>>>>>> latency_database_;
        // energy_database_[proc][model][layer]
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<double>>>>>> energy_database_;
        //
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<std::vector<long>>>>>> buffer_req_database_;


      private:
        std::shared_ptr<DFA::DimensionTable> ConstructDimensionTable(std::shared_ptr<std::vector<std::shared_ptr<DFA::LayerDimension>>> dimensions, bool verbose = false) {
          auto dimension_table = std::make_shared<DFA::DimensionTable>();

          int IX_size, IY_size, R_size, S_size, OX_size, OY_size;
          bool has_IY = false;
          bool has_IX = false;
          bool has_OY =false;
          bool has_OX =false;

          for(auto dim : *dimensions) {
            if(dim->GetName() == DFSL::layer_dim_input_height_) {
              has_IY = true;
              IY_size = dim->GetSize();
            }
            else if(dim->GetName() == DFSL::layer_dim_input_width_) {
              has_IX = true;
              IX_size = dim->GetSize();
            }
            else if(dim->GetName() == DFSL::layer_dim_output_width_ ) {
              has_OX = true;
              OX_size = dim->GetSize();
            }
            else if(dim->GetName() == DFSL::layer_dim_output_height_) {
              has_OY = true;
              OY_size = dim->GetSize();
            }
            else if(dim->GetName() == DFSL::layer_dim_weight_height_) {
              R_size = dim->GetSize();
            }
            else if(dim->GetName() == DFSL::layer_dim_weight_width_) {
              S_size = dim->GetSize();
            }
//            num_macs_ *= dim->GetSize();
            dimension_table->AddDimension(dim);
          }

          if(has_IX && !has_OX) {
            auto ox_dim = std::make_shared<DFA::LayerDimension>(DFSL::layer_dim_output_width_, IX_size - S_size +1);
            dimension_table->AddDimension(ox_dim);
          }
          if(has_IY && !has_OY) {
            auto oy_dim = std::make_shared<DFA::LayerDimension>(DFSL::layer_dim_output_height_, IY_size - R_size +1);
            dimension_table->AddDimension(oy_dim);
          }
          if(!has_IX && has_OX) {
            auto ix_dim = std::make_shared<DFA::LayerDimension>(DFSL::layer_dim_input_width_, OX_size + S_size -1);
            dimension_table->AddDimension(ix_dim);
          }
          if(!has_IY && has_OY) {
            auto iy_dim = std::make_shared<DFA::LayerDimension>(DFSL::layer_dim_input_height_, OY_size + R_size -1);
            dimension_table->AddDimension(iy_dim);
          }

          return dimension_table;
        } // End of function ConstructDimensionTable


        void AnalyzeClusters() {
          for(int proc_id = 0; proc_id < num_procs_; proc_id++) {
            auto proc_dataflow = dataflows_->at(proc_id);
            int num_pes = num_pes_->at(proc_id);
            auto noc = nocs_->at(proc_id);


#ifdef DEBUG_HET_COST_CLASS_HPP_
     std::cout << "Proc id: " << proc_id << ", the number of PEs: " << num_pes << std::endl;
#endif
            for(int model_id = 0; model_id < num_models_ ; model_id++) {
#ifdef DEBUG_HET_COST_CLASS_HPP_
              std::cout << "Model ID: " << model_id  << std::endl;
#endif
              int num_layers = networks_->at(model_id)->size();
              auto model = networks_->at(model_id);

#ifdef DEBUG_HET_COST_CLASS_HPP_
            std::cout << "proc dataflow" << std::endl;
            std::cout << proc_dataflow->ToString() << std::endl;
#endif
            
              for(int layer_id = 0; layer_id < num_layers; layer_id++) {
#ifdef DEBUG_HET_COST_CLASS_HPP_
                std::cout << "Layer ID: " << layer_id << std::endl;
#endif

                auto layer = model->at(layer_id);

                auto layer_dimensions = layer->GetDimensions();
                auto layer_dimension_table = ConstructDimensionTable(layer_dimensions);

                layer_dimension_table->AddOverlapDimensions(overlap_dim_list_);
                bool is_depthwise = layer->GetLayerType() == LayerType::DWCONV;

                std::shared_ptr<DFA::TensorTable> targ_tensor_info = (layer->GetLayerType() == LayerType::DWCONV)? tensors_dw_ : tensors_;
#ifdef DEBUG_HET_COST_CLASS_HPP_
                std::cout << "Cluster analysis entry, num_pes : " << num_pes << std::endl;
                std::cout << "Proc dataflow : " << proc_dataflow->ToString() << std::endl;
#endif
/*
                if(model_id == 0 && layer_id == 0) {
                  std::cout << "0, 0 case" << std::endl;
                  std::cout << "Cluster analysis entry, num_pes : " << num_pes << std::endl;
                  std::cout << "Proc dataflow : " << proc_dataflow->ToString() << std::endl;                
                }

                if(model_id == 0 && layer_id == 1) {
                  std::cout << "0, 1 case" << std::endl;
                  std::cout << "Cluster analysis entry, num_pes : " << num_pes << std::endl;
                  std::cout << "Proc dataflow : " << proc_dataflow->ToString() << std::endl;                
                }
*/
                auto layer_cluster_analysis = std::make_shared<DFA::ClusterAnalysis>(layer->GetLayerType(), num_pes, targ_tensor_info, layer_dimension_table, proc_dataflow, noc);

                cluster_analysis_->at(proc_id)->at(model_id)->push_back(layer_cluster_analysis);
              }
            }
          }
        } // End of function void AnalyzeClusters()

        void AnalyzeCosts() {
          for(int proc_id = 0; proc_id < num_procs_; proc_id++) {
            for(int model_id = 0; model_id < num_models_; model_id++) {
              int num_layers = networks_->at(model_id)->size();
              for(int layer_id = 0; layer_id < num_layers; layer_id ++) {
                auto layer = networks_->at(model_id)->at(layer_id);
                auto targ_cluter_analysis = cluster_analysis_->at(proc_id)->at(model_id)->at(layer_id);
                auto clusters = targ_cluter_analysis->GetClusters();

                std::shared_ptr<DFA::TensorTable> targ_tensor_info = (layer->GetLayerType() == LayerType::DWCONV)? tensors_dw_ : tensors_;

                std::shared_ptr<CA::CostAnalysisEngine> perf_analysis = std::make_unique<CA::CostAnalysisEngine>(targ_tensor_info, clusters, num_simd_units_->at(proc_id), num_pe_cycles_->at(proc_id));
                auto layer_results = perf_analysis->AnalyzeEntireCluster(false);

                analysis_results_->at(proc_id)->at(model_id)->push_back(layer_results);
              }
            }
          }
        } // End of function void AnalyzeCosts()

        void ProcessCostInfo() {
          for(int proc_id = 0; proc_id < num_procs_; proc_id++) {
            for(int model_id = 0; model_id < num_models_; model_id++) {
              int num_layers = networks_->at(model_id)->size();
              for(int layer_id = 0; layer_id < num_layers; layer_id ++) {

                long layer_latency = 0;
                long num_psums = 0;

                long l2_rd_input_count = 0;
                long l2_rd_weight_count = 0;
                long l2_wr_input_count = 0;
                long l2_wr_weight_count = 0;
                long l2_wr_output_count = 0;

                long l1_rd_input_count = 0;
                long l1_rd_weight_count = 0;
                long l1_rd_output_count = 0;

                long l1_wr_input_count = 0;
                long l1_wr_weight_count = 0;
                long l1_wr_output_count = 0;

                double layer_energy = 0;

                auto layer_res = analysis_results_->at(proc_id)->at(model_id)->at(layer_id);
                int num_clusters = layer_res->size();

                auto top_cluster_res = layer_res->at(num_clusters-1);
                layer_latency = top_cluster_res->GetRuntime();
                num_psums = top_cluster_res->GetNumComputations();

                l2_rd_input_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Input);
                l2_rd_weight_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Weight);
                l2_wr_input_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Input);
                l2_wr_weight_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Weight);
                l2_wr_output_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Output);


                layer_energy += l2_rd_input_count * maestro::l2_energy_multiplier;
                layer_energy += l2_wr_input_count * maestro::l2_energy_multiplier;
                layer_energy += l2_rd_weight_count * maestro::l2_energy_multiplier;
                layer_energy += l2_wr_weight_count * maestro::l2_energy_multiplier;
                layer_energy += l2_wr_output_count * maestro::l2_energy_multiplier;

                auto bottom_cluster_res = layer_res->at(0);
/*
                l1_rd_input_count = bottom_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Input);
                l1_rd_weight_count = bottom_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Weight);
                l1_rd_output_count = bottom_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Output);

                l1_wr_input_count = bottom_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Input);
                l1_wr_weight_count = bottom_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Weight);
                l1_wr_output_count = bottom_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Output);
*/
                l1_rd_input_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Input);
                l1_rd_weight_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Weight);
                l1_rd_output_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Output);

                l1_wr_input_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Input);
                l1_wr_weight_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Weight);
                l1_wr_output_count = top_cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Output);


                layer_energy += l1_rd_input_count * maestro::l1_energy_multiplier;
                layer_energy += l1_wr_input_count * maestro::l1_energy_multiplier;
                layer_energy += l1_rd_weight_count * maestro::l1_energy_multiplier;
                layer_energy += l1_wr_weight_count * maestro::l1_energy_multiplier;
                layer_energy += l1_rd_output_count * maestro::l1_energy_multiplier;
                layer_energy += l1_wr_output_count * maestro::l1_energy_multiplier;

                layer_energy += num_psums;
                layer_energy *= maestro::DSE::cost::mac_energy;

                long l2_buffer_req = 0;
                l2_buffer_req += top_cluster_res->GetBufferSizeReq(CA::BufferType::Upstream, DataClass::Input);
                l2_buffer_req += top_cluster_res->GetBufferSizeReq(CA::BufferType::Upstream, DataClass::Output);
                l2_buffer_req += top_cluster_res->GetBufferSizeReq(CA::BufferType::Upstream, DataClass::Weight);

                latency_database_->at(proc_id)->at(model_id)->push_back(layer_latency);
                energy_database_->at(proc_id)->at(model_id)->push_back(layer_energy);
                buffer_req_database_->at(proc_id)->at(model_id)->push_back(l2_buffer_req);
              }
            }
          }
        }// End of function void ProcessCostInfo()

    }; // End of class CostClass

  };
};


#endif

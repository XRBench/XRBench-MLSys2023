#ifndef HET_STATEFUL_COST_FUNCTION_HPP_
#define HET_STATEFUL_COST_FUNCTION_HPP_

#include "BASE_maestro-class.hpp"
#include "BASE_base-objects.hpp"

#include "CA_cost-analysis-engine.hpp"
#include "CA_cost-analysis-results.hpp"

#include "DFA_neural-network.hpp"
#include "DFA_tensor.hpp"
#include "DFA_tensor-table.hpp"
#include "DFA_dimension-table.hpp"
#include "DFA_cluster-analysis.hpp"

#include "DFSL_parser.hpp"

#include "AHW-noc-model.hpp"

//#define DEBUG_HET_STATEFUL_COST_FUNCTION


namespace maestro {
  namespace HET {

    enum class DNNOperator {Conv2D = 0, DWConv2D = 1, NumSupportedOperators};
/*
    template <class CostType>
    class StatefulCostFunction : public MAESTROClass {
      public:
        CostType GetCost();
        bool NextState();
    };
*/

    class MAESTROCostFunction { // : public StatefulCostFunction<double> {
      public:

        MAESTROCostFunction(int num_sub_arrays) :
          target_layer_index_(0) {
          dataflows_ = std::make_shared<std::vector<std::shared_ptr<DFA::NeuralNetwork>>>();
          tensor_tables_ = std::make_shared<std::vector<std::shared_ptr<DFA::TensorTable>>>();
          overlap_dim_list_ = std::make_shared<std::vector<std::shared_ptr<std::list<std::shared_ptr<std::pair<std::string, std::string>>>>>>();

          for(int ops = 0; ops < static_cast<int>(DNNOperator::NumSupportedOperators); ops++) {
            auto tensor_table = std::make_shared<DFA::TensorTable>();
            auto overlap_dim_list_op = std::make_shared<std::list<std::shared_ptr<std::pair<std::string, std::string>>>>();
            tensor_tables_->push_back(tensor_table);
            overlap_dim_list_->push_back(overlap_dim_list_op);
          }

          cluster_analysis_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<DFA::ClusterAnalysis>>>>>();

          noc_configuration_ = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<AHW::NetworkOnChipModel>>>>>();
          if(num_sub_arrays < 1) num_sub_arrays = 1;

          for(int sub_array = 0; sub_array < num_sub_arrays; sub_array++) {
            auto cluster_analysis_subarray = std::make_shared<std::vector<std::shared_ptr<DFA::ClusterAnalysis>>>();
            auto array_noc_config = std::make_shared<std::vector<std::shared_ptr<AHW::NetworkOnChipModel>>>();

            noc_configuration_->push_back(array_noc_config);

            num_pes_.push_back(64);
            cluster_analysis_->push_back(cluster_analysis_subarray);

            this->AddNoC(sub_array+1, 256, 1, 1, true);
            this->AddNoC(sub_array+1, 256, 1, 1, true);
            this->AddNoC(sub_array+1, 256, 1, 1, true);

          }

          this->InitializeTensors();

        }


        long double GetCost(int target_array_id) {
          int target_array_index = target_array_id - 1;
          auto layer_res = AnalyzeLayerCost(target_array_id);


          long double cost = GetEnergyCost(target_array_id, layer_res);


          return cost;
        }

        void ResetState() {
          target_layer_index_ = 0;
        }

        bool NextState() {
          target_layer_index_++;
#ifdef DEBUG_HET_STATEFUL_COST_FUNCTION
          std::cout << "Target layer index is updated to: " << target_layer_index_ << "Full layers: " << num_layers_ << std::endl;
#endif
          if(target_layer_index_ == num_layers_) {
            std::cout << "Finished" << std::endl;
            return false;
          }
          else {
            return true;
          }
        }


        void AddDataflow(std::string target_file_name, bool verbose = false) {
          DFSL::DFSLParser dfsl_parser(target_file_name);
          auto new_network = std::make_shared<DFA::NeuralNetwork>();
          dfsl_parser.ParseDFSL(new_network);

          dataflows_->push_back(new_network);

          int num_layers_of_new_network = new_network->GetNumLayers();
#ifdef DEBUG_HET_STATEFUL_COST_FUNCTION
          std::cout << "Dataflow in file " <<  target_file_name << " indicates " << num_layers_of_new_network << " layers" << std::endl;
#endif
          num_layers_ = (num_layers_ < num_layers_of_new_network) ? num_layers_ : num_layers_of_new_network;

          if(verbose) {
            std::cout << "Parsing finished" << std::endl;
            std::cout <<"Network name:" << new_network->GetName() << std::endl;

            for(auto& layer: *new_network) {
              std::cout << layer->ToString() << std::endl;
            }
          }
        }


        void InitializeTensors() {

          auto output_column_overlap = std::make_shared<std::pair<std::string, std::string>>("X", "S");
          auto output_row_overlap = std::make_shared<std::pair<std::string, std::string>>("Y", "R");

          std::list<std::string> input_coupled_vars = {"C", "Y", "X"};
          std::list<std::string> filter_coupled_vars = {"K", "C", "R", "S"};
          std::list<std::string> output_coupled_vars = {"K", "Y", "X"};

          this->AddTensor(DNNOperator::Conv2D, "input", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Input, input_coupled_vars);
          this->AddTensor(DNNOperator::Conv2D, "weight", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Weight, filter_coupled_vars);
          this->AddTensor(DNNOperator::Conv2D, "output", maestro::DFA::TensorClass::OutputTensor, maestro::DataClass::Output, output_coupled_vars);

          overlap_dim_list_->at(static_cast<int>(DNNOperator::Conv2D))->push_back(output_column_overlap);
          overlap_dim_list_->at(static_cast<int>(DNNOperator::Conv2D))->push_back(output_row_overlap);



          std::list<std::string> filter_coupled_vars_dw = {"K", "C", "R", "S"};
          std::list<std::string> output_coupled_vars_dw = {"C", "Y", "X"};

          this->AddTensor(DNNOperator::DWConv2D, "input", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Input, input_coupled_vars);
          this->AddTensor(DNNOperator::DWConv2D, "weight", maestro::DFA::TensorClass::InputTensor, maestro::DataClass::Weight, filter_coupled_vars_dw);
          this->AddTensor(DNNOperator::DWConv2D, "output", maestro::DFA::TensorClass::OutputTensor, maestro::DataClass::Output, output_coupled_vars_dw);

          overlap_dim_list_->at(static_cast<int>(DNNOperator::DWConv2D))->push_back(output_column_overlap);
          overlap_dim_list_->at(static_cast<int>(DNNOperator::DWConv2D))->push_back(output_row_overlap);

        }


        void UpdateNumPEs(int target_array_id, int new_num_pes) {
          int target_array_index = target_array_id -1;
          num_pes_[target_array_index] = new_num_pes;
          this->AnalyzeClusters(target_array_id);
        }

        int GetNumLayers() {
          return num_layers_;
        }

      protected:
        std::vector<int> num_pes_;
        int num_layers_ = 10000;
        int target_layer_index_ = 0;
        long num_macs_ = 1;
        std::shared_ptr<std::vector<std::shared_ptr<DFA::NeuralNetwork>>> dataflows_;
        std::shared_ptr<std::vector<std::shared_ptr<DFA::TensorTable>>> tensor_tables_;
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<DFA::ClusterAnalysis>>>>> cluster_analysis_; //[TargetArray][Layer]
        std::shared_ptr<std::vector<std::shared_ptr<std::list<std::shared_ptr<std::pair<std::string, std::string>>>>>> overlap_dim_list_;
        std::shared_ptr<std::vector<std::shared_ptr<std::vector<std::shared_ptr<AHW::NetworkOnChipModel>>>>> noc_configuration_;


      private:
        void AddTensor(DNNOperator targ_dnn_operator,
                        std::string tensor_name,
                        DFA::TensorClass tensor_class,
                        DataClass data_class,
                        std::list<std::string>& coupled_vars) {
          std::shared_ptr<std::list<std::string>> coupled_var_list = std::make_shared<std::list<std::string>>(coupled_vars);
          std::shared_ptr<DFA::Tensor> new_tensor = std::make_shared<DFA::Tensor>(tensor_name, tensor_class, data_class, coupled_var_list);
          tensor_tables_->at(static_cast<int>(targ_dnn_operator))->AddTensor(new_tensor);
        }

        void AddNoC(int target_array_id, int bandwidth, int hops, int hop_latency, bool multicast_support, bool verbose = false) {
          int target_array_index = target_array_id -1;

          if(target_array_index < noc_configuration_->size()) {
            auto noc = std::make_shared<maestro::AHW::NetworkOnChipModel>(bandwidth, hops, hop_latency, multicast_support);
            noc_configuration_ ->at(target_array_index)->push_back(noc);

            if(verbose) {
               std::cout << "Added a NoC at cluster level" << noc_configuration_ ->at(target_array_id)->size() << std::endl;
            }
          }
          else {
            std::cout << "Adding NoC to invalid target array" << std::endl;
            exit(-1);
            //this->error_handler_->TerminateProgram();
          }
        }


        std::shared_ptr<DFA::DimensionTable> ConstructDimensionTable(std::shared_ptr<std::vector<std::shared_ptr<DFA::LayerDimension>>> dimensions, bool verbose = false) {
          auto dimension_table = std::make_shared<DFA::DimensionTable>();


          int IX_size, IY_size, R_size, S_size, OX_size, OY_size;
          bool has_IY = false;
          bool has_IX = false;
          bool has_OY =false;
          bool has_OX =false;

          num_macs_ = 1;

          for(auto dim : *dimensions) {
            if(dim->GetName() == "Y") {
              has_IY = true;
              IY_size = dim->GetSize();
            }
            else if(dim->GetName() == "X") {
              has_IX = true;
              IX_size = dim->GetSize();
            }
            else if(dim->GetName() == "X'") {
              has_OX = true;
              OX_size = dim->GetSize();
            }
            else if(dim->GetName() == "Y'") {
              has_OY = true;
              OY_size = dim->GetSize();
            }
            else if(dim->GetName() == "R") {
              R_size = dim->GetSize();
            }
            else if(dim->GetName() == "S") {
              S_size = dim->GetSize();
            }
            num_macs_ *= dim->GetSize();
            dimension_table->AddDimension(dim);
          }

          if(has_IX && !has_OX) {
            auto ox_dim = std::make_shared<DFA::LayerDimension>("X'", IX_size - S_size +1);
            dimension_table->AddDimension(ox_dim);
          }
          if(has_IY && !has_OY) {
            auto oy_dim = std::make_shared<DFA::LayerDimension>("Y'", IY_size - R_size +1);
            dimension_table->AddDimension(oy_dim);
          }
          if(!has_IX && has_OX) {
            auto ix_dim = std::make_shared<DFA::LayerDimension>("X", OX_size + S_size -1);
            dimension_table->AddDimension(ix_dim);
          }
          if(!has_IY && has_OY) {
            auto iy_dim = std::make_shared<DFA::LayerDimension>("Y", OY_size + R_size -1);
            dimension_table->AddDimension(iy_dim);
          }

          if(verbose) {
            std::cout << "Dimensions" << std::endl;

            for(auto dim : *dimension_table) {
              std::cout << "Dim " << dim->GetName() << ", size = " << dim->GetSize() << std::endl;
            }

            std::cout << std::endl;
          }

          return dimension_table;
        }

        void AnalyzeClusters(
            int target_array_id,
            bool verbose = false) {

          int target_array_index = target_array_id - 1;

          cluster_analysis_->at(target_array_index)->clear();

          for(auto layer: *dataflows_->at(target_array_index)) {

            auto dataflow = layer->GetDataflow();
            auto dimensions = layer->GetDimensions();
            auto dimension_table = ConstructDimensionTable(dimensions);

            DNNOperator op = (layer->GetLayerType() == LayerType::DWCONV)? DNNOperator::DWConv2D : DNNOperator::Conv2D;
            auto targ_overlap_dim_list = overlap_dim_list_->at(static_cast<int>(op));

            dimension_table->AddOverlapDimensions(targ_overlap_dim_list);


            if(verbose) {
              std::cout << "Layer " << layer->GetName() << std::endl;
              std::cout << "<Dataflow>\n" << dataflow->ToString() <<std::endl;
            }

            std::shared_ptr<DFA::ClusterAnalysis> cluster_analysis;

            if(layer->GetLayerType() == LayerType::DWCONV) {
              cluster_analysis = std::make_shared<DFA::ClusterAnalysis>
                                    (layer->GetLayerType(), num_pes_[target_array_index], tensor_tables_->at(static_cast<int>(op)),
                                     dimension_table, dataflow, noc_configuration_->at(target_array_index));
            }
            else {
              cluster_analysis = std::make_shared<DFA::ClusterAnalysis>
                                    (layer->GetLayerType(), num_pes_[target_array_index],
                                     tensor_tables_->at(static_cast<int>(op)),
                                     dimension_table, dataflow, noc_configuration_->at(target_array_index));


            }

            cluster_analysis_->at(target_array_index)->push_back(cluster_analysis);
          }

          if(verbose) {
            std::cout << "Cluster construction and analysis is done" << std::endl;
          }


        }


        std::shared_ptr<std::vector<std::shared_ptr<CA::CostAnalyisResults>>> AnalyzeLayerCost(int target_array_id, bool verbose = false) {
          int target_array_index = target_array_id - 1;

          auto target_cluster_analysis = cluster_analysis_->at(target_array_index)->at(this->target_layer_index_);
          auto clusters = target_cluster_analysis->GetClusters();

          auto op = GetOperatorType(target_array_id, target_layer_index_);

          auto perf_analysis = std::make_unique<CA::CostAnalysisEngine>(tensor_tables_->at(static_cast<int>(op)), clusters, 1, 1);
          auto results = perf_analysis->AnalyzeEntireCluster(verbose);

          if(verbose) {
            for(int cluster_lv = 0; cluster_lv < target_cluster_analysis->GetClusters()->size(); cluster_lv++) {
              std::cout << "Cluster dataflow at level " << cluster_lv << "\n" << target_cluster_analysis->GetClusters()->GetCluster(cluster_lv)->GetDataflow()->ToString() << std::endl;
            }

            for(int cluster_lv = 0; cluster_lv < target_cluster_analysis->GetClusters()->size(); cluster_lv++) {
              std::cout << "Dimensions at level " << cluster_lv << std::endl;
              auto dimensions = target_cluster_analysis->GetClusters()->GetCluster(cluster_lv)->GetDimensions();
              for(auto& dim : *dimensions) {
                std::cout << dim->ToString() << std::endl;
              }
            }
          }

          return results;
        }

        long double GetEnergyCost(int target_array_id, std::shared_ptr<std::vector<std::shared_ptr<CA::CostAnalyisResults>>> layer_cost_analysis_res) {
          int target_array_index = target_array_id - 1;

          int cluster_lv = 0;
          long layer_runtime = 0;
          int num_top_clusters = 0;
          int num_bottom_clusters= 0 ;

//          long total_runtime = 0;
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


          long double layer_energy = 0;
          long double pe_array_energy = 0;
          long double buffer_energy = 0;
          long num_psums = 0;

          long num_iters = this->GetTempIterOverInnermostCluster(target_array_id, target_layer_index_);
          std::shared_ptr<maestro::CA::CostAnalyisResults> top_res;

          for(auto& cluster_res : *layer_cost_analysis_res) {
            top_res = cluster_res;

            if(cluster_lv == layer_cost_analysis_res->size()-1) {
//              total_runtime += cluster_res->GetRuntime();
              l2_rd_input_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Input);
              l2_rd_weight_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Weight);
              l2_wr_input_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Input);
              l2_wr_weight_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Weight);
              l2_wr_output_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Upstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Output);

              long num_sub_clusters = cluster_res->GetNumSubClusters();
              num_top_clusters = num_sub_clusters;

              buffer_energy += l2_rd_input_count * maestro::l2_energy_multiplier;
              buffer_energy += l2_wr_input_count * maestro::l2_energy_multiplier;
              buffer_energy += l2_rd_weight_count * maestro::l2_energy_multiplier;
              buffer_energy += l2_wr_weight_count * maestro::l2_energy_multiplier;
              buffer_energy += l2_wr_output_count * maestro::l2_energy_multiplier;

              num_psums = cluster_res->GetNumComputations();
            }
            if(cluster_lv == 0) {

              l1_rd_input_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Input);
              l1_rd_weight_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Weight);
              l1_rd_output_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Read, maestro::DataClass::Output);
              l1_wr_input_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Input);
              l1_wr_weight_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Weight);
              l1_wr_output_count = cluster_res->GetBufferAccessCount(maestro::CA::BufferType::Downstream, maestro::CA::BufferAccessType::Write, maestro::DataClass::Output);


              long num_sub_clusters = cluster_res->GetNumSubClusters();
              long num_cur_clusters = num_pes_[target_array_index] / num_sub_clusters;
              num_bottom_clusters = num_cur_clusters;

              buffer_energy += l1_rd_input_count * maestro::l1_energy_multiplier;
              buffer_energy += l1_wr_input_count * maestro::l1_energy_multiplier;
              buffer_energy += l1_rd_weight_count * maestro::l1_energy_multiplier;
              buffer_energy += l1_wr_weight_count * maestro::l1_energy_multiplier;
              buffer_energy += l1_rd_output_count * maestro::l1_energy_multiplier;
              buffer_energy += l1_wr_output_count * maestro::l1_energy_multiplier;
            }

            cluster_lv++;
          }


          std::cout << " Num PSums: " << num_psums  << std::endl;
          buffer_energy *= maestro::DSE::cost::mac_energy;
          pe_array_energy = num_psums * maestro::DSE::cost::mac_energy;

          layer_energy = buffer_energy + pe_array_energy;

          return layer_energy;
        }



        int GetNumTopClusters(int target_array_id) {
          int target_array_index = target_array_id - 1;
          return cluster_analysis_->at(target_array_index)->at(this->target_layer_index_)->GetClusters()->GetCluster(0)->GetNumClusters(false);
        }

        long GetTempIterOverInnermostCluster(int target_array_id, int layer_index) {
          int target_array_index = target_array_id - 1;
          auto target_cluster_table = cluster_analysis_->at(target_array_index)->at(layer_index)->GetClusters();
          long ret = 1;
          for(int cluster_idx = 0; cluster_idx < target_cluster_table->size()-1; cluster_idx++) {
            ret *= target_cluster_table->GetCluster(cluster_idx)->GetNumTotalIterations();
          }
          return ret;
        }


        DNNOperator GetOperatorType(int target_array_id, int layer_id) {
          int target_array_index = target_array_id - 1;

          DNNOperator op = (dataflows_->at(target_array_index)->at(layer_id)->GetLayerType() == LayerType::DWCONV)? DNNOperator::DWConv2D : DNNOperator::Conv2D;

          return op;
        }


    }; // End of class StatefulCostFunction
  }; // End of namespace HET
}; // End of namespace maestro

#endif

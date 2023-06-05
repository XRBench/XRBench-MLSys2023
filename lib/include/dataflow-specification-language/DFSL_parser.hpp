/******************************************************************************
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
*******************************************************************************/


#ifndef MAESTRO_DFSL_PARSER_HPP_
#define MAESTRO_DFSL_PARSER_HPP_

#include <string>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <memory>
#include <map>

#include<boost/tokenizer.hpp>
#include<boost/format.hpp>

#include "DSE_design-options.hpp"
#include "DFA_directive-table.hpp"
#include "DFA_directives.hpp"
#include "DFA_layer.hpp"
#include "DFA_neural-network.hpp"
#include "DFA_tensor.hpp"
#include "DFSL_syntax_tokens.hpp"



namespace maestro {
	namespace DFSL {

		enum class ParserState{Idle, Network_Identifier, Network_Name, Network_Body,
				                   Layer_Identifier, Layer_Name, Layer_Body, Layer_Type,
				                   Stride_Decl, Stride_Body, Stride_Size,
				                   Dimension_Decl, Dimension_Body, Dimension_Size,
		                       Dataflow_Decl, Dataflow_Body, Dataflow_MapSize, Dataflow_MapOffset, Dataflow_MapVar, Dataflow_ClusterSize, Dataflow_ClusterType,
                           Network_Dependency, Dependency_Body,
		                       Accelerator_Identifier, Acclerator_Body,
		                       PE_Decl, PE_Identifier, PE_Body, PE_NumPE, PE_VectorWidth, PE_MultPrecision, PE_AddPrecision,
		                       Buffer_Decl, Buffer_Identifier, Buffer_Body, Buffer_Size, Buffer_L2, Buffer_L1,
		                       Noc_Decl, NoC_Identifier, NoC_Name, Noc_Name_Identifier, SubNoC_Body, NoC_Body, NoC_BW, NoC_Latency,
                           Network_FPS, Network_Prob
		                       };

		class InputParser {

			public:
				InputParser(std::string file_nm) :
					file_name_(file_nm) {
					in_file_.open(file_nm);
					if(!in_file_) {
						std::cout << "Failed to open the input file" << std::endl;
					}
			}
				virtual ~InputParser() {}

			protected:
				std::string file_name_;
				std::ifstream in_file_;

				void ParseError(int line_num) {
					std::cout << "[MAESTRO Parser] Parse error at line number " + std::to_string(line_num) + " in target file " +  file_name_  << std::endl;
					exit(-1);
				}
		}; // End of class InputParser

		class DFSLParser : public InputParser {
			public:
				DFSLParser(std::string file_name) : InputParser(file_name), num_pes_(0) {
				}

				void ParseDFSL(std::shared_ptr<DFA::NeuralNetwork> network) {
					std::string line;
					boost::char_separator<char> sep(" ,->():\t;");
					int line_number = 1;
					network = std::make_shared<DFA::NeuralNetwork>();
          network->SetName("network_name");
          std::shared_ptr<DFA::DirectiveTable> prev_directive_table = nullptr;
					std::shared_ptr<DFA::DirectiveTable> directive_table = nullptr;

					std::shared_ptr<DFA::Layer> curr_layer = nullptr;
					std::shared_ptr<DFA::LayerDimension> curr_dim = nullptr;
					std::shared_ptr<std::vector<std::shared_ptr<DFA::LayerDimension>>> dim_vector = nullptr;

					std::shared_ptr<std::map<std::string, int>> stride_info = nullptr;

					DFA::directive::DirectiveClass curr_directive_class = DFA::directive::DirectiveClass::Invalid;
					std::shared_ptr<DFA::directive::Directive> curr_directive = nullptr;

					std::string stride_dim;

					int map_size = 0;
					int map_offset = 0;
					int cluster_size = 0;
					bool had_dim_def = false;
					bool get_dim_size = false;
          int inner_stride = 1;
          bool is_tr_conv = false;

					LayerType layer_type;
					std::string tmp_name;

					while(std::getline(in_file_, line)) {
						boost::tokenizer<boost::char_separator<char>> tokn(line, sep);
						for(auto &tkn : tokn) {
						  if(tkn.size() >= 2 && tkn.substr(0,2) == DFSL::comments_) {
                line_number++;
						    break;
						  }

							switch(state_) {
							  case ParserState::Idle: {
                  if(tkn == DFSL::network_decl_) {
                    state_ = ParserState::Network_Identifier;
                  }
                  else if(tkn == DFSL::accelerator_decl_) {
                    state_ = ParserState::Accelerator_Identifier;
                  }
                  break;
							  }

                case ParserState::Network_Identifier: {

                  //Doesn't have to give a network name
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Network_Body;
                  }
                  else if(!tkn.empty()) {
                    network->SetName(tkn);
                  }
                  else {
                    ParseError(line_number);
                  }

                  break;
                }

                case ParserState::Network_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Idle;
                  }
                  else if (tkn == DFSL::network_fps_) {
                    state_ = ParserState::Network_FPS;
                  }
                  else if (tkn == DFSL::layer_decl_) {
                    state_ = ParserState::Layer_Identifier;
                  }
                  else {
                    std::cout << tkn << std::endl;
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Network_FPS: {
                  int fps = std::atoi(tkn.c_str());
                  // std::cout << "FPS: " << fps << std::endl;
                  if(fps < 1) {
                    std::cout << "[Error] FPS must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    network->SetFPS(fps);
                    state_ = ParserState::Network_Body;
                  }
                  break;
                }

                case ParserState::Layer_Identifier: {
                  if(tkn == DFSL::brace_open_) {
                    dim_vector = std::make_shared<std::vector<std::shared_ptr<DFA::LayerDimension>>>();
                    directive_table = std::make_shared<DFA::DirectiveTable>();
                    stride_info = std::make_shared<std::map<std::string, int>>();
                    state_ = ParserState::Layer_Body;
                  }
                  else {
                    tmp_name = tkn;
                  }
                  break;
                }

                case ParserState::Layer_Body: {
                  if(tkn == DFSL::brace_close_) {
                    if(curr_layer == nullptr) {
                      ParseError(line_number);
                    }
                    curr_layer->SetDimensions(dim_vector);

                    if(directive_table->size() == 0) {
                      directive_table = std::make_shared<DFA::DirectiveTable>(*prev_directive_table);
                      curr_layer->SetDataflow(directive_table);
                      prev_directive_table = directive_table;
                    }
                    else {
                      curr_layer->SetDataflow(directive_table);
                      prev_directive_table = std::make_shared<DFA::DirectiveTable>(*directive_table);
                    }
                    curr_layer->SetLayerType(layer_type);

                    network->AddLayer(curr_layer);

                    layer_type = LayerType::NumLayerTypes;
                    inner_stride = 1;
                    is_tr_conv = false;
                    dim_vector = nullptr;
                    directive_table = nullptr;
                    curr_layer = nullptr;
                    stride_info = nullptr;
                    had_dim_def = false;
                    state_ = ParserState::Network_Body;
                  }
                  else if(tkn == DFSL::layer_type_decl_) {
                    state_ = ParserState::Layer_Type;
                  }
                  else if(tkn == DFSL::layer_stride_decl_) {
                    if(had_dim_def) {
                      std::cout << "[Error] Stride description must precede to dimension description" << std::endl;
                      ParseError(line_number);
                    }
                    else {
                      state_ = ParserState::Stride_Decl;
                    }
                  }
                  else if(tkn == DFSL::layer_dim_decl_) {
                    had_dim_def = true;
                    state_ = ParserState::Dimension_Decl;
                  }
                  else if(tkn == DFSL::layer_dataflow_decl_) {
                    state_ = ParserState::Dataflow_Decl;
                  }
                  else {
                    ParseError(line_number);
                  }

                  break;
                }

                case ParserState::Stride_Decl: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Stride_Body;
                  }
                  else {
                    std::cout << "[Error] Syntax error; stride description: Stride {dim1: sz, dim2: sz, ...}. " << std::endl;
                    ParseError(line_number);
                  }

                  break;
                }

                case ParserState::Stride_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Layer_Body;
                  }
                  else {
                    stride_dim = tkn;
                    state_ = ParserState::Stride_Size;
                  }

                  break;
                }

                case ParserState::Stride_Size: {
                  int stride = std::atoi(tkn.c_str());
                  if(stride < 1) {
                    std::cout << "[Error] Stride must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    (*stride_info)[stride_dim] = stride;
                    state_ = ParserState::Stride_Body;
                  }
                  break;
                }

                case ParserState::Layer_Type: {
                  if(tkn == DFSL::layer_type_conv2d_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::ConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::ConvLayer>(DFSL::layer_decl_);
                    }
                    layer_type = LayerType::CONV2D;
                  }
                  else if(tkn == DFSL::layer_type_fc_) {
                    //TODO
                  }
                  else if(tkn == DFSL::layer_type_dsconv_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::DSConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::DSConvLayer>(DFSL::layer_decl_);
                    }
                    layer_type = LayerType::DWCONV;
                  }
                  else if(tkn == DFSL::layer_type_ngconv_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::NGConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::NGConvLayer>(DFSL::layer_decl_);
                    }
                    layer_type = LayerType::NGCONV;
                  }
                  else if(tkn == DFSL::layer_type_lstm_) {
                    //TODO
                  }
                  else if(tkn == DFSL::layer_type_pool_) {
                    //TODO
                  }
                  else if(tkn == DFSL::layer_type_trconv_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::ConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::ConvLayer>(DFSL::layer_decl_);
                    }
                    is_tr_conv = true;
                    inner_stride = 2; //TODO: Fix this hard-coded one
                    layer_type = LayerType::CONV2D;
                    //TODO
                  }
                  else {
                    ParseError(line_number);
                  }
                  state_ = ParserState::Layer_Body;

                  break;
                }

                case ParserState::Dimension_Decl: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Dimension_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dimension_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Layer_Body;
                  }
                  else {
                    if(!tkn.empty()) {
                      tmp_name = tkn;
                    }
                    else {
                      ParseError(line_number);
                    }
                    state_ = ParserState::Dimension_Size;
                  }
                  break;
                }

                case ParserState::Dimension_Size: {
                  int size = std::atoi(tkn.c_str());
                  if(size == 0) {
                    ParseError(line_number);
                  }
                  else {

                    int stride_size = 1;
                    if(stride_info->find(tmp_name) != stride_info->end()) {
                      stride_size = (*stride_info)[tmp_name];
                    }

                    curr_dim = std::make_shared<DFA::LayerDimension> (tmp_name, size, stride_size);
                    dim_vector->push_back(curr_dim);
                    state_ = ParserState::Dimension_Body;
                  }
                  break;
                }
                case ParserState::Dataflow_Decl: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Dataflow_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dataflow_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Layer_Body;
                  }
                  else if(tkn == DFSL::dataflow_temporal_map_) {
                    curr_directive_class = DFA::directive::DirectiveClass::TemporalMap;
                    state_ = ParserState::Dataflow_MapSize;
                  }
                  else if(tkn == DFSL::dataflow_spatial_map_) {
                    curr_directive_class = DFA::directive::DirectiveClass::SpatialMap;
                    state_ = ParserState::Dataflow_MapSize;
                  }
                  else if(tkn == DFSL::dataflow_cluster_) {
                    curr_directive_class = DFA::directive::DirectiveClass::Cluster;
                    state_ = ParserState::Dataflow_ClusterSize;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dataflow_MapSize: {

                  if(tkn == DFSL::dataflow_dim_size_indicatior_) {
                    get_dim_size = true;
                    continue;
                  }

                  if(get_dim_size) {
                    map_size = -1;

                    for(auto& dim_info : *dim_vector) {
                      if(dim_info->GetName() == tkn) {
                        map_size = dim_info->GetSize();
                      }
                    }

                    if(map_size == -1) { // If not found
                      std::cout << "[Error] Cannot find the dimension " << tkn << "from dimension description" << std::endl;
                      ParseError(line_number);
                    }
                  }
                  else {
                    map_size = std::atoi(tkn.c_str());
                  }

                  if(map_size <= 0) {
                    ParseError(line_number);
                  }

                  get_dim_size = false;
                  state_ = ParserState::Dataflow_MapOffset;
                  break;
                }

                case ParserState::Dataflow_MapOffset: {
                  if(tkn == DFSL::dataflow_dim_size_indicatior_) {
                    get_dim_size = true;
                    continue;
                  }

                  if(get_dim_size) {
                    map_offset = -1;

                    for(auto& dim_info : *dim_vector) {
                      if(dim_info->GetName() == tkn) {
                        map_offset = dim_info->GetSize();
                      }
                    }

                    if(map_size == -1) { // If not found
                      std::cout << "[Error] Cannot find the dimension " << tkn << "from dimension description" << std::endl;
                      ParseError(line_number);
                    }
                  }
                  else {
                    map_offset = std::atoi(tkn.c_str());
                  }

                  if(map_offset <= 0) {
                    ParseError(line_number);
                  }

                  get_dim_size = false;
                  state_ = ParserState::Dataflow_MapVar;
                  break;
                }

                case ParserState::Dataflow_MapVar: {
                  if(tkn.empty()) {
                    ParseError(line_number);
                  }

                  switch(curr_directive_class) {
                  case DFA::directive::DirectiveClass::TemporalMap: {
                    curr_directive = std::make_shared<DFA::directive::TemporalMap> (map_size, map_offset, tkn);
                    break;
                  }
                  case DFA::directive::DirectiveClass::SpatialMap: {
                    curr_directive = std::make_shared<DFA::directive::SpatialMap> (map_size, map_offset, tkn);
                    break;
                  }
                  default: {
                    ParseError(line_number);
                  }
                  }

                  directive_table->AddDirective(curr_directive);
                  curr_directive = nullptr;
                  state_=ParserState::Dataflow_Body;
                  break;
                }

                case ParserState::Dataflow_ClusterSize: {
                  if(tkn == DFSL::dataflow_dim_size_indicatior_) {
                    get_dim_size = true;
                    continue;
                  }

                  if(get_dim_size) {
                    cluster_size = -1;

                    for(auto& dim_info : *dim_vector) {
                      if(dim_info->GetName() == tkn) {
                        cluster_size = dim_info->GetSize();
                      }
                    }

                    if(map_size == -1) { // If not found
                      std::cout << "[Error] Cannot find the dimension " << tkn << "from dimension description" << std::endl;
                      ParseError(line_number);
                    }
                  }
                  else {
                    cluster_size = std::atoi(tkn.c_str());
                  }

                  if(cluster_size <= 0) {
                    ParseError(line_number);
                  }

                  get_dim_size = false;
                  state_ = ParserState::Dataflow_ClusterType;
                  break;
                }

                case ParserState::Dataflow_ClusterType: {

                  if(tkn == DFSL::dataflow_cluster_type_logical_) {
                    curr_directive = std::make_shared<DFA::directive::Cluster>(cluster_size, DFA::directive::ClusterType::Logical);
                  }
                  else if(tkn == DFSL::dataflow_cluster_type_physical_) {
                    curr_directive = std::make_shared<DFA::directive::Cluster>(cluster_size, DFA::directive::ClusterType::Physical);
                  }

                  directive_table->AddDirective(curr_directive);
                  curr_directive = nullptr;
                  state_=ParserState::Dataflow_Body;
                  break;
                }

                case ParserState::Accelerator_Identifier: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Acclerator_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Acclerator_Body: {
                  if(tkn == DFSL::pe_decl_) {
                    state_ = ParserState::PE_Identifier;
                  }
                  else if(tkn == DFSL::buffer_decl_) {
                    state_ = ParserState::Buffer_Identifier;
                  }
                  else if(tkn == DFSL::noc_decl_) {
                    state_ = ParserState::NoC_Identifier;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::PE_Identifier: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::PE_Body;
                  }
                  else {
                    //TODO: Add an error message
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Buffer_Identifier: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Buffer_Body;
                  }
                  else {
                    //TODO: Add an error message
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::PE_Body: {
                    if(tkn == DFSL::num_pe_decl_) {
                      state_ = ParserState::PE_NumPE;
                      break;
                    }
                    else if(tkn == DFSL::vector_width_decl_) {
                      state_ = ParserState::PE_VectorWidth;
                      break;
                    }
                    else if(tkn == DFSL::mult_precision_decl_) {
                      state_ = ParserState::PE_MultPrecision;
                      break;
                    }
                    else if(tkn == DFSL::add_precision_decl_) {
                      state_ = ParserState::PE_AddPrecision;
                      break;
                    }
                    else if(tkn == DFSL::vector_width_decl_) {
                      state_ = ParserState::PE_VectorWidth;
                      break;
                    }
                    else if(tkn == DFSL::brace_close_) {
                      state_ = ParserState::Acclerator_Body;
                      break;
                    }
                    else {
                      ParseError(line_number);
                    }

                  break;
                }

                case ParserState::PE_NumPE: {
                  int num_pes = std::atoi(tkn.c_str());
                  if(num_pes < 1) {
                    std::cout << "The number of PEs needs to be an integer larger than 0. Given number of PEs: "
                        << num_pes << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    num_pes_ = num_pes;
                    state_ = ParserState::PE_Body;
                  }
                  break;
                }

                case ParserState::PE_VectorWidth: {
                  int vector_width = std::atoi(tkn.c_str());
                  if(vector_width < 1) {
                    std::cout << "The number ALUs (vector width) of PEs needs to be an integer larger than 0. Given size: "
                        << vector_width << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    pe_vector_width_ = vector_width;
                    state_ = ParserState::PE_Body;
                  }

                  break;
                }

                case ParserState::PE_MultPrecision: {
                  if(tkn == DFSL::fp4_precision) {
                    mult_op_type_ = DSE::OpType::FloatPoint;
                    mult_precision_ = 4;
                  }
                  else if(tkn == DFSL::fp8_precision) {
                    mult_op_type_ = DSE::OpType::FloatPoint;
                    mult_precision_ = 8;
                  }
                  else if(tkn == DFSL::fp16_precision) {
                    mult_op_type_ = DSE::OpType::FloatPoint;
                    mult_precision_ = 16;
                  }
                  else if(tkn == DFSL::fp32_precision) {
                    mult_op_type_ = DSE::OpType::FloatPoint;
                    mult_precision_ = 32;
                  }
                  else if(tkn == DFSL::int4_precision) {
                    mult_op_type_ = DSE::OpType::FixedPoint;
                    mult_precision_ = 4;
                  }
                  else if(tkn == DFSL::int8_precision) {
                    mult_op_type_ = DSE::OpType::FixedPoint;
                    mult_precision_ = 8;
                  }
                  else if(tkn == DFSL::int16_precision) {
                    mult_op_type_ = DSE::OpType::FixedPoint;
                    mult_precision_ = 16;
                  }
                  else if(tkn == DFSL::int32_precision) {
                    mult_op_type_ = DSE::OpType::FixedPoint;
                    mult_precision_ = 32;
                  }
                  else {
                    std::cout << "Unsupported precision!" << std::endl;
                    ParseError(line_number);
                  }

                  state_ = ParserState::PE_Body;
                  break;
                }

                case ParserState::PE_AddPrecision: {
                  if(tkn == DFSL::fp4_precision) {
                    add_op_type_ = DSE::OpType::FloatPoint;
                    add_precision_ = 4;
                  }
                  else if(tkn == DFSL::fp8_precision) {
                    add_op_type_ = DSE::OpType::FloatPoint;
                    add_precision_ = 8;
                  }
                  else if(tkn == DFSL::fp16_precision) {
                    add_op_type_ = DSE::OpType::FloatPoint;
                    add_precision_ = 16;
                  }
                  else if(tkn == DFSL::fp32_precision) {
                    add_op_type_ = DSE::OpType::FloatPoint;
                    add_precision_ = 32;
                  }
                  else if(tkn == DFSL::int4_precision) {
                    add_op_type_ = DSE::OpType::FixedPoint;
                    add_precision_ = 4;
                  }
                  else if(tkn == DFSL::int8_precision) {
                    add_op_type_ = DSE::OpType::FixedPoint;
                    add_precision_ = 8;
                  }
                  else if(tkn == DFSL::int16_precision) {
                    add_op_type_ = DSE::OpType::FixedPoint;
                    add_precision_ = 16;
                  }
                  else if(tkn == DFSL::int32_precision) {
                    add_op_type_ = DSE::OpType::FixedPoint;
                    add_precision_ = 32;
                  }
                  else {
                    std::cout << "Unsupported precision!" << std::endl;
                    ParseError(line_number);
                  }

                  state_ = ParserState::PE_Body;
                  break;
                }

                case ParserState::Buffer_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Acclerator_Body;
                  }
                  else {
                    buffer_name_.push_back(tkn);
                    state_ = ParserState::Buffer_Size;
                  }
                  break;
                }

                case ParserState::Buffer_Size: {
                  int buffer_size = std::atoi(tkn.c_str());

                  if(buffer_size < 1) {
                    std::cout << "Buffer size must be larger than 0" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    buffer_sizes_.push_back(buffer_size);
                  }
                  state_ = ParserState::Buffer_Body;
                  break;
                }

                case ParserState::NoC_Identifier: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::NoC_Body;
                  }
                  else {
                    //TODO: Add an error message
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::NoC_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Acclerator_Body;
                  }
                  else {
                    noc_name_.push_back(tkn);
                    state_ = ParserState::Noc_Name_Identifier;
                  }
                  break;
                }

                case ParserState::Noc_Name_Identifier: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::SubNoC_Body;
                  }
                  else {
                    //TODO: Add an error message
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::SubNoC_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::NoC_Body;
                  }
                  else if(tkn == DFSL::noc_bandwidth_decl_) {
                    state_ = ParserState::NoC_BW;
                  }
                  else if (tkn == DFSL::noc_avg_latency_decl_) {
                    state_ = ParserState::NoC_Latency;
                  }
                  else {
                    //TODO: Add an error message
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::NoC_BW: {
                  int noc_bw = std::atoi(tkn.c_str());
                  if(noc_bw < 1) {
                    ParseError(line_number);
                  }
                  else {
                    noc_bandwidth_.push_back(noc_bw);
                    state_ = ParserState::SubNoC_Body;
                  }
                  break;
                }

                case ParserState::NoC_Latency: {
                  int noc_latency = std::atoi(tkn.c_str());
                  if(noc_latency < 1) {
                    ParseError(line_number);
                  }
                  else {
                    noc_latency_.push_back(noc_latency);
                    state_ = ParserState::SubNoC_Body;
                  }
                  break;
                }

                default: {
                  ParseError(line_number);
                  break;
                }
							} // End of switch(state_)
						} // End of for(tkn)

						line_number++;

					} // End of while(getline(...))

					if(state_ != ParserState::Idle) {
						ParseError(line_number);
					}

				}

			protected:
				ParserState state_ = ParserState::Idle;
				int num_pes_;
				int pe_vector_width_;
				DSE::OpType mult_op_type_;
				int mult_precision_;
        DSE::OpType add_op_type_;
        int add_precision_;

        std::vector<std::string> buffer_name_;
        std::vector<int> buffer_sizes_;
        std::vector<std::string> noc_name_;
        std::vector<int> noc_bandwidth_;
        std::vector<int> noc_latency_;



		}; // End of class DFSLParser

    class ModelParser : public InputParser {
      public:
        ModelParser(std::string file_nm) :
          InputParser(file_nm) {
        }

        std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::NeuralNetwork>>> ParseModel() {
          std::string line;
          boost::char_separator<char> sep(" ,->():\t;");
          int line_number = 1;
          int current_model_id = 0;

          auto models = std::make_shared<std::vector<std::shared_ptr<maestro::DFA::NeuralNetwork>>>();

          auto current_model = std::make_shared<maestro::DFA::NeuralNetwork>();

          std::shared_ptr<DFA::DirectiveTable> directive_table = nullptr;

          std::shared_ptr<DFA::Layer> curr_layer = nullptr;
          std::shared_ptr<DFA::LayerDimension> curr_dim = nullptr;
          std::shared_ptr<std::vector<std::shared_ptr<DFA::LayerDimension>>> dim_vector = nullptr;

          std::shared_ptr<std::map<std::string, int>> stride_info = nullptr;

          DFA::directive::DirectiveClass curr_directive_class = DFA::directive::DirectiveClass::Invalid;
          std::shared_ptr<DFA::directive::Directive> curr_directive = nullptr;

          std::vector<std::pair<std::string, int>> all_stride_info;
          std::string stride_dim;

          int map_size = 0;
          int map_offset = 0;
          int cluster_size = 0;
          bool had_dim_def = false;
          bool get_dim_size = false;
          int inner_stride = 1;
          bool is_tr_conv = false;

          LayerType layer_type;
          std::string tmp_name;

          while(std::getline(in_file_, line)) {
            boost::tokenizer<boost::char_separator<char>> tokn(line, sep);
            for(auto &tkn : tokn) {
              //Handling comments
              if(tkn.size() >= 2 && tkn.substr(0,2) == DFSL::comments_) {
                break;
              }

              switch(state_) {
                case ParserState::Idle: {
                  if(tkn == DFSL::network_decl_) {
                    state_ = ParserState::Network_Identifier;
                  }
                  else if(tkn == DFSL::layer_dataflow_decl_) {
                    state_ = ParserState::Dataflow_Decl;
                  }
                  else {
                    this->ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Network_Identifier: {
                  //Doesn't have to give a network name
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Network_Body;
                  }
                  else if(!tkn.empty()) {
                    current_model->SetName(tkn);
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Network_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Idle;

                    models->push_back(current_model);
                    // current_model = std::make_shared<std::vector<std::shared_ptr<maestro::DFA::Layer>>>();
                    current_model = std::make_shared<maestro::DFA::NeuralNetwork>();
                  }
                  else if (tkn == DFSL::network_fps_) {
                    state_ = ParserState::Network_FPS;
                  }
                  else if (tkn == DFSL::network_prob_) {
                    state_ = ParserState::Network_Prob;
                  }
                  else if (tkn == DFSL::dependency_decl_) {
                    state_ = ParserState::Network_Dependency;
                  }
                  else if (tkn == DFSL::layer_decl_) {
                    state_ = ParserState::Layer_Identifier;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Network_Dependency: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Dependency_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dependency_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Network_Body;
                  }
                  else {
                    current_model->SetDependency(tkn);
                  }
                  break;
                }

                case ParserState::Network_FPS: {
                  int fps = std::atoi(tkn.c_str());
                  // std::cout << "FPS: " << fps << std::endl;
                  if(fps < 1) {
                    std::cout << "[Error] FPS must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_model->SetFPS(fps);
                    state_ = ParserState::Network_Body;
                  }
                  break;
                }

                case ParserState::Network_Prob : {
                  float prob = std::atof(tkn.c_str());
                  // std::cout << "prob: " << prob << std::endl;
                  if(prob < 0 || prob > 1) {
                    std::cout << "[Error] Probility must be in [0,1] range " << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_model->SetProb(prob);
                    state_ = ParserState::Network_Body;
                  }
                  break;
                }

                case ParserState::Layer_Identifier: {
                  if(tkn == DFSL::brace_open_) {
                    dim_vector = std::make_shared<std::vector<std::shared_ptr<DFA::LayerDimension>>>();
                    directive_table = std::make_shared<DFA::DirectiveTable>();
                    stride_info = std::make_shared<std::map<std::string, int>>();
                    state_ = ParserState::Layer_Body;
                  }
                  else {
                    tmp_name = tkn;
                  }
                  break;
                }

                case ParserState::Layer_Body: {
                  if(tkn == DFSL::brace_close_) {
                    if(curr_layer == nullptr) {
                      ParseError(line_number);
                    }
                    curr_layer->SetDimensions(dim_vector);
                    curr_layer->SetDataflow(directive_table);
                    curr_layer->SetLayerType(layer_type);

                    // current_model->push_back(curr_layer);
                    current_model->AddLayer(curr_layer);
                    layer_type = LayerType::NumLayerTypes;
                    inner_stride = 1;
                    is_tr_conv = false;
                    dim_vector = nullptr;
                    directive_table = nullptr;
                    curr_layer = nullptr;
                    stride_info = nullptr;
                    had_dim_def = false;
                    state_ = ParserState::Network_Body;
                  }
                  else if(tkn == DFSL::layer_type_decl_) {
                    state_ = ParserState::Layer_Type;
                  }
                  else if(tkn == DFSL::layer_stride_decl_) {
                    if(had_dim_def) {
                      std::cout << "[Error] Stride description must precede to dimension description" << std::endl;
                      ParseError(line_number);
                    }
                    else {
                      state_ = ParserState::Stride_Decl;
                    }
                  }
                  else if(tkn == DFSL::layer_dim_decl_) {
                    had_dim_def = true;
                    state_ = ParserState::Dimension_Decl;
                  }
                  else if(tkn == DFSL::layer_dataflow_decl_) {
                    state_ = ParserState::Dataflow_Decl;
                  }
                  else {
                    ParseError(line_number);
                  }

                  break;
                }

                case ParserState::Stride_Decl: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Stride_Body;
                  }
                  else {
                    std::cout << "[Error] Syntax error; stride description: Stride {dim1: sz, dim2: sz, ...}. " << std::endl;
                    ParseError(line_number);
                  }

                  break;
                }

                case ParserState::Stride_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Layer_Body;
                  }
                  else {
                    stride_dim = tkn;
                    state_ = ParserState::Stride_Size;
                  }

                  break;
                }

                case ParserState::Stride_Size: {
                  int stride = std::atoi(tkn.c_str());
                  if(stride < 1) {
                    std::cout << "[Error] Stride must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    (*stride_info)[stride_dim] = stride;
                    state_ = ParserState::Stride_Body;
                  }
                  break;
                }


                case ParserState::Layer_Type: {
                  if(tkn == DFSL::layer_type_conv2d_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::ConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::ConvLayer>(DFSL::layer_decl_);
                    }
                    layer_type = LayerType::CONV2D;
                  }
                  else if(tkn == DFSL::layer_type_fc_) {
                    //TODO
                  }
                  else if(tkn == DFSL::layer_type_dsconv_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::DSConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::DSConvLayer>(DFSL::layer_decl_);
                    }
                    layer_type = LayerType::DWCONV;
                  }
                  else if(tkn == DFSL::layer_type_ngconv_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::NGConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::NGConvLayer>(DFSL::layer_decl_);
                    }
                    layer_type = LayerType::NGCONV;
                  }
                  else if(tkn == DFSL::layer_type_lstm_) {
                    //TODO
                  }
                  else if(tkn == DFSL::layer_type_pool_) {
                    //TODO
                  }
                  else if(tkn == DFSL::layer_type_trconv_) {
                    if(!tmp_name.empty()) {
                      curr_layer = std::make_shared<DFA::ConvLayer>(tmp_name);
                      tmp_name.clear();
                    }
                    else {
                      curr_layer = std::make_shared<DFA::ConvLayer>(DFSL::layer_decl_);
                    }
                    is_tr_conv = true;
                    inner_stride = 2; //TODO: Fix this hard-coded one
                    layer_type = LayerType::CONV2D;
                    //TODO
                  }
                  else {
                    ParseError(line_number);
                  }
                  state_ = ParserState::Layer_Body;

                  break;
                }


                case ParserState::Dimension_Decl: {
                  if(tkn == DFSL::brace_open_) {
                    state_ = ParserState::Dimension_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dimension_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = ParserState::Layer_Body;
                  }
                  else {
                    if(!tkn.empty()) {
                      tmp_name = tkn;
                    }
                    else {
                      ParseError(line_number);
                    }
                    state_ = ParserState::Dimension_Size;
                  }
                  break;
                }

                case ParserState::Dimension_Size: {
                  int size = std::atoi(tkn.c_str());
                  if(size == 0) {
                    ParseError(line_number);
                  }
                  else {
                    curr_dim = std::make_shared<DFA::LayerDimension> (tmp_name, size, 1);
                    dim_vector->push_back(curr_dim);
                    state_ = ParserState::Dimension_Body;
                  }
                  break;
                }

                default: {
                  break;
                }
              } // End of switch(state_)

            } // End of for(tkn)

            line_number++;
          } // End of while


          return models;
        }// End of function ParseModel()


      protected:
        ParserState state_ = ParserState::Idle;


      private:
    }; // End of class Modelparser


    class DataflowParser : public InputParser {
      public:

        DataflowParser(std::string file_nm) :
          InputParser(file_nm) {
        }

        std::shared_ptr<std::vector<std::shared_ptr<DFA::DirectiveTable>>> ParseDataflow() {
          auto models = std::make_shared<std::vector<std::shared_ptr<std::vector<std::shared_ptr<maestro::DFA::Layer>>>>>();

          std::string line;
          boost::char_separator<char> sep(" ,->():\t;");
          int line_number = 1;
          int current_model_id = 0;

          std::shared_ptr<std::vector<std::shared_ptr<DFA::DirectiveTable>>> dataflows = std::make_shared<std::vector<std::shared_ptr<DFA::DirectiveTable>>>();
          std::shared_ptr<DFA::DirectiveTable> directive_table = nullptr;

          DFA::directive::DirectiveClass curr_directive_class = DFA::directive::DirectiveClass::Invalid;
          std::shared_ptr<DFA::directive::Directive> curr_directive = nullptr;

          int map_size = 0;
          int map_offset = 0;
          int cluster_size = 0;

          std::vector<std::pair<std::string, int>> all_stride_info;
          std::string stride_dim;

          std::string tmp_name;

          while(std::getline(in_file_, line)) {
            boost::tokenizer<boost::char_separator<char>> tokn(line, sep);
            for(auto &tkn : tokn) {

              //Handling comments
              if(tkn.size() >= 2 && tkn.substr(0,2) == DFSL::comments_) {
                break;
              }

              switch(state_) {
                case ParserState::Idle: {
                  if(tkn == DFSL::layer_dataflow_decl_) {
                    state_ = ParserState::Dataflow_Decl;
                  }
                  else {
                    this->ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dataflow_Decl: {
                  if(tkn == DFSL::brace_open_) {
                    directive_table = std::make_shared<DFA::DirectiveTable>();
                    state_ = ParserState::Dataflow_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dataflow_Body: {
                  if(tkn == DFSL::brace_close_) {
                    dataflows->push_back(directive_table);
                    state_ = ParserState::Idle;
                  }
                  else if(tkn == DFSL::dataflow_temporal_map_) {
                    curr_directive_class = DFA::directive::DirectiveClass::TemporalMap;
                    state_ = ParserState::Dataflow_MapSize;
                  }
                  else if(tkn == DFSL::dataflow_spatial_map_) {
                    curr_directive_class = DFA::directive::DirectiveClass::SpatialMap;
                    state_ = ParserState::Dataflow_MapSize;
                  }
                  else if(tkn == DFSL::dataflow_cluster_) {
                    curr_directive_class = DFA::directive::DirectiveClass::Cluster;
                    state_ = ParserState::Dataflow_ClusterSize;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case ParserState::Dataflow_MapSize: {
                  map_size = std::atoi(tkn.c_str());

                  if(map_size == 0) {
                    ParseError(line_number);
                  }

                  state_ = ParserState::Dataflow_MapOffset;
                  break;
                }

                case ParserState::Dataflow_MapOffset: {
                  map_offset = std::atoi(tkn.c_str());

                  if(map_offset == 0) {
                    ParseError(line_number);
                  }

                  state_ = ParserState::Dataflow_MapVar;
                  break;
                }

                case ParserState::Dataflow_MapVar: {
                  if(tkn.empty()) {
                    ParseError(line_number);
                  }

                  switch(curr_directive_class) {
                  case DFA::directive::DirectiveClass::TemporalMap: {
                    curr_directive = std::make_shared<DFA::directive::TemporalMap> (map_size, map_offset, tkn);
                    break;
                  }
                  case DFA::directive::DirectiveClass::SpatialMap: {
                    curr_directive = std::make_shared<DFA::directive::SpatialMap> (map_size, map_offset, tkn);
                    break;
                  }
                  default: {
                    ParseError(line_number);
                  }
                  }

                  directive_table->AddDirective(curr_directive);
                  curr_directive = nullptr;
                  state_=ParserState::Dataflow_Body;
                  break;
                }

                case ParserState::Dataflow_ClusterSize: {
                  cluster_size = std::atoi(tkn.c_str());

                  if(cluster_size == 0) {
                    ParseError(line_number);
                  }

                  state_ = ParserState::Dataflow_ClusterType;
                  break;
                }

                case ParserState::Dataflow_ClusterType: {

                  if(tkn == DFSL::dataflow_cluster_type_logical_) {
                    curr_directive = std::make_shared<DFA::directive::Cluster>(cluster_size, DFA::directive::ClusterType::Logical);
                  }
                  else if(tkn == DFSL::dataflow_cluster_type_physical_) {
                    curr_directive = std::make_shared<DFA::directive::Cluster>(cluster_size, DFA::directive::ClusterType::Physical);
                  }
                  else {
                    curr_directive = std::make_shared<DFA::directive::Cluster>(cluster_size, DFA::directive::ClusterType::Physical);
                  }

                  directive_table->AddDirective(curr_directive);
                  curr_directive = nullptr;
                  state_=ParserState::Dataflow_Body;
                  break;
                }

                default: {
                  break;
                }
              } // End of switch(state_)
            } // End of for each token in a read line
          } // End of while(get_line != EOF)


          return dataflows;
        } // End of function ParseDataflow

      protected:
        ParserState state_ = ParserState::Idle;

      private:

    }; // End of class DataflowParser


	}; // End of namespace DFSL
}; // End of namespace maestro

#endif

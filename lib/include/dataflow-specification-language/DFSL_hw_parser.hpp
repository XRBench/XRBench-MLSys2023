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

#pragma once

#include <string>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <memory>
#include <map>

#include<boost/tokenizer.hpp>
#include<boost/format.hpp>

#include "AHW_Accelerator.hpp"
#include "DSE_design-options.hpp"
#include "DFA_directive-table.hpp"
#include "DFA_directives.hpp"
#include "DFA_layer.hpp"
#include "DFA_neural-network.hpp"
#include "DFA_tensor.hpp"
#include "DFSL_syntax_tokens.hpp"
#include "DFSL_parser.hpp"



namespace maestro {
  namespace DFSL {

    enum class HWParserState {
      Idle, Accelerator_Identifier, Acclerator_Body,
      NumPE_Identifier,
      OffchipBW_Identifier,
      TopNoCBW_Identifier,
      TopNoCLatency_Identifier,
      TopNoCMulticast_Identifier,
      ColNoCBW_Identifier,
      ColNoCLatency_Identifier,
      ColNoCMulticast_Identifier,
      GlobalSharedMem_Identifier,
      PELocalMem_Identifier
    };

    class HWParser : public InputParser {
      public:
        HWParser(std::string file_nm) :
          InputParser(file_nm) {
        }

        std::shared_ptr<std::vector<std::shared_ptr<maestro::AHW::AcceleratorInfo>>> ParseHW() {
          std::string line;
          boost::char_separator<char> sep(" ,->():\t;");
          int line_number = 1;
          int current_acc_id = 0;

          auto hw_info = std::make_shared<std::vector<std::shared_ptr<maestro::AHW::AcceleratorInfo>>>();
          auto current_acc = std::make_shared<maestro::AHW::AcceleratorInfo>();
          auto state_ = HWParserState::Idle;

          std::string tmp_name;

          while(std::getline(in_file_, line)) {
            boost::tokenizer<boost::char_separator<char>> tokn(line, sep);
            for(auto &tkn : tokn) {
              //Handling comments
              if(tkn.size() >= 2 && tkn.substr(0,2) == DFSL::comments_) {
                break;
              }

              switch(state_) {
                case HWParserState::Idle: {
                  if(tkn == DFSL::accelerator_decl_) {
                    state_ = HWParserState::Accelerator_Identifier;
                  }
                  else {
                    this->ParseError(line_number);
                  }
                  break;
                }

                case HWParserState::Accelerator_Identifier: {
                  //Doesn't have to give a network name
                  if(tkn == DFSL::brace_open_) {
                    state_ = HWParserState::Acclerator_Body;
                  }
                  else if(!tkn.empty()) {
                    current_acc->name = tkn;
                  }
                  else {
                    std::cout << "Expected " << DFSL::brace_open_ << ", but receied " << tkn << std::endl;
                    ParseError(line_number);
                  }
                  break;
                }

                case HWParserState::Acclerator_Body: {
                  if(tkn == DFSL::brace_close_) {
                    state_ = HWParserState::Idle;

                    hw_info->push_back(current_acc);
                    // current_model = std::make_shared<std::vector<std::shared_ptr<maestro::DFA::Layer>>>();
                    current_acc = std::make_shared<maestro::AHW::AcceleratorInfo>();
                  }
                  else if (tkn == DFSL::num_pe_identifier_) {
                    state_ = HWParserState::NumPE_Identifier ;
                  }
                  else if (tkn == DFSL::offchip_bandwidth_identifier_) {
                    state_ = HWParserState::OffchipBW_Identifier;
                  }
                  else if (tkn == DFSL::top_noc_bw_identifier_) {
                    state_ = HWParserState::TopNoCBW_Identifier;
                  }
                  else if (tkn == DFSL::top_noc_latency_identifier_) {
                    state_ = HWParserState::TopNoCLatency_Identifier;
                  }
                  else if (tkn == DFSL::top_noc_multicast_identifier_) {
                    state_ = HWParserState::TopNoCMulticast_Identifier;
                  }
                  else if (tkn == DFSL::col_noc_bw_identifier_) {
                    state_ = HWParserState::ColNoCBW_Identifier;
                  }
                  else if (tkn == DFSL::col_noc_latency_identifier_) {
                    state_ = HWParserState::ColNoCLatency_Identifier;
                  }
                  else if (tkn == DFSL::col_noc_multicast_identifier_) {
                    state_ = HWParserState::ColNoCMulticast_Identifier;
                  }
                  else if (tkn == DFSL::global_shared_mem_identifier_) {
                    state_ = HWParserState::GlobalSharedMem_Identifier;
                  }
                  else if (tkn == DFSL::pe_local_mem_identifier_) {
                    state_ = HWParserState::PELocalMem_Identifier;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case HWParserState::NumPE_Identifier: {
                  int num_pes = std::atoi(tkn.c_str());
                  if(num_pes < 1) {
                    std::cout << "[Error] The number of PEs must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->num_pes = num_pes;
                    state_ = HWParserState::Acclerator_Body;
                  }
                  break;
                }

                case HWParserState::OffchipBW_Identifier: {
                  int offchip_bw = std::atoi(tkn.c_str());
                  if(offchip_bw < 1) {
                    std::cout << "[Error] The offchip BW must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->offchip_bw = offchip_bw;
                    state_ = HWParserState::Acclerator_Body;
                  }
                  break;
                }

                case HWParserState::TopNoCBW_Identifier: {
                  int bw = std::atoi(tkn.c_str());
                  if(bw < 1) {
                    std::cout << "[Error] The top NoC BW must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->noc_bandwidth.push_back(bw);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  break;
                }

                case HWParserState::TopNoCLatency_Identifier: {
                  int latency = std::atoi(tkn.c_str());
                  if(latency < 1) {
                    std::cout << "[Error] The top NoC latency must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->noc_latency.push_back(latency);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  break;
                }

                case HWParserState::TopNoCMulticast_Identifier: {
                  if (tkn == DFSL::true_identifier_) {
                    current_acc->noc_multicast.push_back(true);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  else if (tkn == DFSL::false_identifier_) {
                    current_acc->noc_multicast.push_back(false);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case HWParserState::ColNoCBW_Identifier: {
                  int bw = std::atoi(tkn.c_str());
                  if(bw < 1) {
                    std::cout << "[Error] The top NoC BW must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->noc_bandwidth.push_back(bw);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  break;
                }

                case HWParserState::ColNoCLatency_Identifier: {
                  int latency = std::atoi(tkn.c_str());
                  if(latency < 1) {
                    std::cout << "[Error] The top NoC latency must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->noc_latency.push_back(latency);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  break;
                }

                case HWParserState::ColNoCMulticast_Identifier: {
                  if (tkn == DFSL::true_identifier_) {
                    current_acc->noc_multicast.push_back(true);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  else if (tkn == DFSL::false_identifier_) {
                    current_acc->noc_multicast.push_back(false);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  else {
                    ParseError(line_number);
                  }
                  break;
                }

                case HWParserState::GlobalSharedMem_Identifier: {
                  int mem_size = std::atoi(tkn.c_str());
                  if(mem_size < 1) {
                    std::cout << "[Error] The memory size must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->memory_size.push_back(mem_size);
                    state_ = HWParserState::Acclerator_Body;
                  }
                  break;
                }

                case HWParserState::PELocalMem_Identifier: {
                  int mem_size = std::atoi(tkn.c_str());
                  if(mem_size < 1) {
                    std::cout << "[Error] The memory size must be a positive integer value" << std::endl;
                    ParseError(line_number);
                  }
                  else {
                    current_acc->memory_size.push_back(mem_size);
                    state_ = HWParserState::Acclerator_Body;
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


          return hw_info;
        }// End of function ParseModel()


      protected:
        ParserState state_ = ParserState::Idle;


      private:
    }; // End of class Modelparser

    }; // End of namespace DFSL
}; // End of namespace maestro

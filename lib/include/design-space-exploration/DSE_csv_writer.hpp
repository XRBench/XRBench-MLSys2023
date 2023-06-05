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


#ifndef MAESTRO_DSE_CSV_WRITER_HPP_
#define MAESTRO_DSE_CSV_WRITER_HPP_

#include <boost/filesystem.hpp>
#include <iostream>
#include <fstream>
#include <string>

#include "DSE_design_point.hpp"
#include "API_configuration.hpp"

namespace maestro {
  namespace DSE {
  	class CSVWriter {
  		public:
  			long num_partial_sums_ = 1;
        long runtime_ = 0;
        double energy_ = 0;
        long double performance_per_energy_ = 0;
        double area_ = 0;
        double power_ = 0;
        int num_pes_ = 1;
        int noc_bw_ = 16;
        int vector_width_ = 1;
        int l2_sram_sz = 1;
        int l1_sram_sz = 1;


        CSVWriter(std::shared_ptr<Configuration> maestro_config, std::string file_name_) :
          num_partial_sums_(1) {
          bool file_exists = boost::filesystem::exists(file_name_);

          outfile_.open(file_name_,std::fstream::in | std::fstream::out | std::fstream::app);

          if(!file_exists) {
            outfile_ << "Neural Network Name, Layer Number, NumPEs, Runtime (Cycles), Activity count-based Energy (nJ), Throughput (MACs/Cycle), Throughput Per Energy (GMACs/s*J), " <<
                        "Area, Power, NoC BW (Elements), Vector Width,  L2 SRAM Size (Bytes), L1 SRAM Size (Bytes), Multicasting Factor (Weight), Multicasting Factor (Input), "
                     << "Num Total Input Pixels, Num Total Weight Pixels, Ops/J, Num MACs, PE power, L1 power, L2 power, NOC power, ";

            for(auto& tensor : *maestro_config->tensors_) {
              auto dataclass = tensor->GetDataClass();
              auto tensor_name = tensor->GetTensorName();
              outfile_ << tensor_name << " l1 read, " << tensor_name << " l1 write, " << tensor_name << " l2 read, " << tensor_name << " l2 write, " << tensor_name << " reuse factor" << ",";
            }

            outfile_ << std::endl;
          }

        }

        CSVWriter(std::shared_ptr<ConfigurationV2> maestro_config, std::string file_name_) :
          num_partial_sums_(1) {
          bool file_exists = boost::filesystem::exists(file_name_);

          outfile_.open(file_name_,std::fstream::in | std::fstream::out | std::fstream::app);

          if(!file_exists) {
            outfile_ << "Neural Network Name, Layer Number, NumPEs, Runtime (Cycles), Activity count-based Energy (nJ), Throughput (MACs/Cycle), Throughput Per Energy (GMACs/s*J), " <<
                        "Area, Power, NoC BW (Elements), Vector Width,  L2 SRAM Size (Bytes), L1 SRAM Size (Bytes), Multicasting Factor (Weight), Multicasting Factor (Input), "
                     << "Num Total Input Pixels, Num Total Weight Pixels, Ops/J, Num MACs, PE power, L1 power, L2 power, NOC power, ";

            for(auto& tensor : *maestro_config->tensors_->at(0)) { // TODO: fix this hard-coded part ( at(0) )
              auto dataclass = tensor->GetDataClass();
              auto tensor_name = tensor->GetTensorName();
              outfile_ << tensor_name << " l1 read, " << tensor_name << " l1 write, " << tensor_name << " l2 read, " << tensor_name << " l2 write, " << tensor_name << " reuse factor" << ",";
            }

            outfile_ << std::endl;
          }

        }



        CSVWriter(std::string file_name_) :
          num_partial_sums_(1) {
          bool file_exists = boost::filesystem::exists(file_name_);

          outfile_.open(file_name_,std::fstream::in | std::fstream::out | std::fstream::app);

          if(!file_exists) {
            outfile_ << "Neural Network Name, Layer Number, NumPEs, Runtime (Cycles), Activity count-based Energy (nJ), Throughput (MACs/Cycle), Throughput Per Energy (GMACs/s*J), " <<
                        "Area, Power, NoC BW (Elements), Vector Width,  L2 SRAM Size (Bytes), L1 SRAM Size (Bytes), Multicasting Factor (Weight), Multicasting Factor (Input), "
                     << "Num Total Input Pixels, Num Total Weight Pixels, Ops/J, Num MACs, PE power, L1 power, L2 power, NOC power" << std::endl;
          }

        }


  			CSVWriter(std::string file_name_, long num_partial_sums) :
  				num_partial_sums_(num_partial_sums) {
  			  bool file_exists = boost::filesystem::exists(file_name_);


          outfile_.open(file_name_, std::fstream::in | std::fstream::out | std::fstream::app);

          if(!file_exists) {
            outfile_ << "NumPEs, Runtime (Cycles), Activity count-based Energy (nJ), Throughput (MACs/Cycle), Throughput Per Energy (GMACs/s*J), "
                     << "Area, Power, NoC BW (Elements), Vector Width,  L2 SRAM Size (Bytes), L1 SRAM Size (Bytes), Multicasting Factor (Weight), Multicasting Factor (Input), "
                     << " Num Total Input Pixels, Num Total Weight Pixels, Ops/J, Num MACs, PE power, L1 power, L2 power, NOC power" << std::endl;
          }

  			}

        CSVWriter(std::shared_ptr<Configuration> maestro_config, std::string file_name_, long num_partial_sums) :
          num_partial_sums_(num_partial_sums) {
          bool file_exists = boost::filesystem::exists(file_name_);

          outfile_.open(file_name_, std::fstream::in | std::fstream::out | std::fstream::app);

          if(!file_exists) {
            outfile_ << "NumPEs, Runtime (Cycles), Activity count-based Energy (nJ), Throughput (MACs/Cycle), Throughput Per Energy (GMACs/s*J), "
                     << "Area, Power, NoC BW (Elements), Vector Width,  L2 SRAM Size (Bytes), L1 SRAM Size (Bytes), Multicasting Factor (Weight), Multicasting Factor (Input), "
                     << " Num Total Input Pixels, Num Total Weight Pixels, Ops/J, Num MACs, PE power, L1 power, L2 power, NOC power";

            for(auto& tensor : * maestro_config->tensors_) {
              auto dataclass = tensor->GetDataClass();
              auto tensor_name = tensor->GetTensorName();
              outfile_ << tensor_name << " l1 read, " << tensor_name << " l1 write, " << tensor_name << " l2 read, " << tensor_name << " l2 write, " << tensor_name << " reuse factor" << std::endl;
            }
          }
          outfile_ << std::endl;
        }


  			void WriteDesignPoint(std::shared_ptr<DesignPoint> dp) {
  				double throughput =  static_cast<double>(num_partial_sums_)/ static_cast<double>(dp->runtime_);
  				outfile_ << dp->num_pes_ << "," << dp->runtime_ << "," << dp->energy_ << "," << throughput << ","  << dp->performance_per_energy_
  						     << "," << dp->area_ << "," << dp->power_ << "," << dp->noc_bw_ << "," << dp->vector_width_ << "," << dp->l2_sram_sz << ","
									 <<  dp->l1_sram_sz << "," << dp->GetMulticastingFactor("weight") << "," << dp->GetMulticastingFactor("input") << std::endl;
  			}

        void WriteDesignPoint(std::shared_ptr<DesignPoint> dp, std::string nn_name, int layer_num, long num_partial_sums, long num_inputs, long num_weights, double ops_per_joule, double pe_power, double l1_power, double l2_power, double noc_power) {
          double throughput =  static_cast<double>(num_partial_sums)/ static_cast<double>(dp->runtime_);
          outfile_ << nn_name << "," << layer_num << "," << dp->num_pes_ << "," << dp->runtime_ << "," << dp->energy_ << "," << throughput << ","  << dp->performance_per_energy_
                   << "," << dp->area_ << "," << dp->power_ << "," << dp->noc_bw_ << "," << dp->vector_width_ << "," << dp->l2_sram_sz << ","
                   <<  dp->l1_sram_sz << "," << dp->GetMulticastingFactor("weight") << "," << dp->GetMulticastingFactor("input")
                   << "," << num_inputs << "," << num_weights << "," << ops_per_joule << "," << num_partial_sums
                   << "," << pe_power << "," << l1_power << "," << l2_power << "," << noc_power << std::endl;
        }


        void WriteDesignPoint(
            std::shared_ptr<Configuration> maestro_config,
            std::shared_ptr<DesignPoint> dp,
            std::string nn_name,
            int layer_num, long num_partial_sums, long num_inputs, long num_weights,
            double ops_per_joule, double pe_power, double l1_power, double l2_power,
            double noc_power, std::shared_ptr<CA::CostAnalyisResults> cost_analysis_results) {
          double throughput =  static_cast<double>(num_partial_sums)/ static_cast<double>(dp->runtime_);
          outfile_ << nn_name << "," << layer_num << "," << dp->num_pes_ << "," << dp->runtime_ << "," << dp->energy_ << "," << throughput << ","  << dp->performance_per_energy_
                   << "," << dp->area_ << "," << dp->power_ << "," << dp->noc_bw_ << "," << dp->vector_width_ << "," << dp->l2_sram_sz << ","
                   <<  dp->l1_sram_sz << "," << dp->GetMulticastingFactor("weight") << "," << dp->GetMulticastingFactor("input")
                   << "," << num_inputs << "," << num_weights << "," << ops_per_joule << "," << num_partial_sums
                   << "," << pe_power << "," << l1_power << "," << l2_power << "," << noc_power << ",";

          for(auto& tensor : *maestro_config->tensors_) {
            auto dataclass = tensor->GetDataClass();

            long l1_read = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Downstream, CA::BufferAccessType::Read, dataclass);
            long l1_write = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Downstream, CA::BufferAccessType::Write, dataclass);
            long l2_read = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Upstream, CA::BufferAccessType::Read, dataclass);
            long l2_write = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Upstream, CA::BufferAccessType::Write, dataclass);

            outfile_ << l1_read << ", " << l1_write << ", " << l2_read << ", " << l2_write << ", ";
            long double reuse_factor = static_cast<long double>(l1_read) / static_cast<long double>(l1_write);
            outfile_ << reuse_factor << ", ";
          }

          outfile_ << std::endl;
        }


        void WriteDesignPoint(
            std::shared_ptr<ConfigurationV2> maestro_config,
            int tensor_idx,
            std::shared_ptr<DesignPoint> dp,
            std::string nn_name,
            std::string layer_name, long num_partial_sums, long num_inputs, long num_weights,
            double ops_per_joule, double pe_power, double l1_power, double l2_power,
            double noc_power, std::shared_ptr<CA::CostAnalyisResults> cost_analysis_results) {
          double throughput =  static_cast<double>(num_partial_sums)/ static_cast<double>(dp->runtime_);
          outfile_ << nn_name << "," << layer_name << "," << dp->num_pes_ << "," << dp->runtime_ << "," << dp->energy_ << "," << throughput << ","  << dp->performance_per_energy_
                   << "," << dp->area_ << "," << dp->power_ << "," << dp->noc_bw_ << "," << dp->vector_width_ << "," << dp->l2_sram_sz << ","
                   <<  dp->l1_sram_sz << "," << dp->GetMulticastingFactor("weight") << "," << dp->GetMulticastingFactor("input")
                   << "," << num_inputs << "," << num_weights << "," << ops_per_joule << "," << num_partial_sums
                   << "," << pe_power << "," << l1_power << "," << l2_power << "," << noc_power << ",";

          for(auto& tensor : *maestro_config->tensors_->at(tensor_idx)) {
            auto dataclass = tensor->GetDataClass();

            long l1_read = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Downstream, CA::BufferAccessType::Read, dataclass);
            long l1_write = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Downstream, CA::BufferAccessType::Write, dataclass);
            long l2_read = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Upstream, CA::BufferAccessType::Read, dataclass);
            long l2_write = cost_analysis_results->GetBufferAccessCount(CA::BufferType::Upstream, CA::BufferAccessType::Write, dataclass);

            outfile_ << l1_read << ", " << l1_write << ", " << l2_read << ", " << l2_write << ", ";
            long double reuse_factor = static_cast<long double>(l1_read) / static_cast<long double>(l1_write);
            outfile_ << reuse_factor << ", ";
          }

          outfile_ << std::endl;
        }



  			bool Valid() {
  				return outfile_.is_open();
  			}

  		protected:
  			std::ofstream outfile_;

  	}; // End of class CSVWriter
  }; // End of namespace DSE
}; // End of namespace maestro

#endif

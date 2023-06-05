#ifndef MAESTRO_AHW_ACCELERATOR_HPP_
#define MAESTRO_AHW_ACCELERATOR_HPP_

#include <vector>
#include <string>

#include "DSE_design-options.hpp"

namespace maestro {

  namespace AHW {

    class Accelerator {
      public:


      protected:
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


    }; // End of class Accelerator

    class AcceleratorInfo {
      public:
        std::string name;
        int num_pes;
        // NoC Info
        int offchip_bw;
        // TODO: Use a data structure for NoC info
        std::vector<int> noc_bandwidth;
        std::vector<int> noc_latency;
        std::vector<bool> noc_multicast;

        // Buffer Info
        // TODO: Use a data structure for buffer info
        std::vector<int> memory_size;

        std::string to_string() {
          std::string ret = "";
          ret += "Accelerator " + name + " \n";
          ret += "num_pes " + std::to_string(num_pes) + " \n";
          ret += "offchip_bw " + std::to_string(offchip_bw) + " \n";

          ret += "noc_bw\n";
          for(auto it: noc_bandwidth) {
            ret += "  " + std::to_string(it) + " \n";
          }

          ret += "noc_latency\n";
          for(auto it: noc_latency) {
            ret += "  " + std::to_string(it) + "\n";
          }

          ret += "noc_multicast\n";
          for(auto it: noc_latency) {
            std::string print_string = (it)? "True" : "False";
            ret += "  " + print_string + "\n";
          }

          ret += "memory_size\n";
          for(auto it: memory_size) {
            ret += "  " + std::to_string(it) + "\n";
          }

          return ret;
        }
    };

  }; // End of namespace AHW
}; // End of namespace maestro


#endif

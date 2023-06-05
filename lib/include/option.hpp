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


#ifndef MAESTRO_OPTION_HPP_
#define MAESTRO_OPTION_HPP_

#include <iostream>
#include <list>
#include <string>

#include <boost/program_options.hpp>

namespace maestro {


  namespace po = boost::program_options;
  class Options {
    public:
      int np = 7;
      int np1 = -1;
      int np2 = -1;
      int np3 = -1;
      int np4 = -1;
      int np5 = -1;
      int np6 = -1;

      int bw = 1;
      int bw1 = -1;
      int bw2 = -1;
      int bw3 = -1;
      int bw4 = -1;
      int bw5 = -1;

      int hops = 1;
      int hop_latency = 1;
      int pe_delay = 1;
      bool mc = true;
      bool full_buffer = false;
      std::list<std::string> in_tensors = {"weight", "input"};
      std::list<std::string> out_tensors = {"output"};

      std::string model_file_name = "";
      std::string dataflow_file_name = "data/dataflow/maeri.m";
      std::string layer_file_name = "data/layer/vgg16_conv1.m";
      std::string dfsl_file_name = "";
      std::string hw_file_name = "";

      std::string XRBench_timeline_output_file_name = "timeline.csv";
      std::string XRBench_summary_output_file_name = "summary.csv";

      std::string het_stat_output_file_name = "output.csv";
      std::string het_sched_output_file_name = "schedule.csv";


      int num_simd_lanes = 9;
      bool do_reduction = true;
      bool do_implicit_reduction = true;
      bool fg_sync = false;
      bool do_schedule_only = false;

      bool do_dse = true;
      bool do_sweep = false;
      bool do_print_ds = false;
      int l1_size = 16;
      int l2_size = 256;
      int min_num_pes = 1024;
      int min_noc_bw = 512;
      int max_num_pes = 1024;
      int max_noc_bw = 512;
      double area_cap = 1000000.0; // unit: um^2
      double power_cap = 10000.0; // unit: mW
      std::string optimization_target = "runtime";
      bool verbose = false;
      bool print_design_space_to_file = false;
      int pe_tick = 4;
      int bw_tick = 4;

      std::string bw_partitioning_strategy = "BruteForce";
      std::string pe_partitioning_strategy = "BruteForce";
      std::string partitioning_strategy = "EnergyGreedy";
      std::string ordering_strategy = "Interleaved";
      std::string time_alignment_strategy = "LookAhead";

      int lookahead_depth = 10;


      bool parse(int argc, char** argv)
      {
          std::vector<std::string> config_fnames;

          po::options_description desc("General Options");
          desc.add_options()
              ("help", "Display help message")
          ;

          po::options_description io("File IO options");
          io.add_options()
            ("model_file", po::value<std::string>(&model_file_name), "the name of model file")
            ("dataflow_file", po::value<std::string>(&dataflow_file_name) ,"the name of dataflow description file")
            ("layer_file", po::value<std::string>(&layer_file_name) ,"the name of layer dimension description file")
            ("DFSL_file", po::value<std::string>(&dfsl_file_name), "the name of DFSL file")
            ("hw_file", po::value<std::string>(&hw_file_name) ,"the name of hw config description file")
            ("het_stat_output_file_name", po::value<std::string>(&het_stat_output_file_name), "the name of heterogeneous architecture stat file")
            ("het_sched_output_file_name", po::value<std::string>(&het_sched_output_file_name), "the name of heterogeneous architecture schedule file")
            ("XRBench_timeline_output_file_name", po::value<std::string>(&XRBench_timeline_output_file_name), "the name of XRBench schedule file")
            ("XRBench_summary_output_file_name", po::value<std::string>(&XRBench_summary_output_file_name), "the name of XRBench results summary file")
          ;

          po::options_description nocs("Network on chip options");
          nocs.add_options()
            ("noc_bw", po::value<int>(&bw), "the bandwidth of NoC")
            ("noc_bw1", po::value<int>(&bw1), "the bandwidth of NoC1")
            ("noc_bw2", po::value<int>(&bw2), "the bandwidth of NoC2")
            ("noc_bw3", po::value<int>(&bw3), "the bandwidth of NoC3")
            ("noc_bw4", po::value<int>(&bw4), "the bandwidth of NoC4")
            ("noc_bw5", po::value<int>(&bw5), "the bandwidth of NoC5")
            ("noc_hops", po::value<int>(&hops), "the average number of NoC hops")
            ("noc_hop_latency", po::value<int>(&hop_latency), "the latency for each of NoC hop")
            ("noc_mc_support", po::value<bool>(&mc), "the multicasting capability of NoC")
          ;

          po::options_description pe_array("Processing element options");
          pe_array.add_options()
            ("num_pes", po::value<int>(&np), "the number of PEs")
            ("num_pes1", po::value<int>(&np1), "the number of PEs")
            ("num_pes2", po::value<int>(&np2), "the number of PEs")
            ("num_pes3", po::value<int>(&np3), "the number of PEs")
            ("num_pes4", po::value<int>(&np4), "the number of PEs")
            ("num_pes5", po::value<int>(&np5), "the number of PEs")
            ("num_pes6", po::value<int>(&np6), "the number of PEs")
            ("pe_delay", po::value<int>(&pe_delay), "The ALU delay of PEs")
            ("num_simd_lanes", po::value<int>(&num_simd_lanes), "the number of ALUs in each PE")
            ("do_implicit_reduction", po::value<bool>(&do_implicit_reduction), "If PEs reduce items as soon as they generate partial results; if set as true, reductions do not require additional cycles.")
            ("do_fg_sync", po::value<bool>(&fg_sync), "Fine-grained synchronization is performed (future work)")
          ;

          po::options_description problem("Problem description options");
          problem.add_options()
            ("do_reduction_op", po::value<bool>(&do_reduction), "If the problem requires reduction or not")
          ;

          po::options_description dse("Design Space Exploration options");
          dse.add_options()
            ("full_buffer", po::value<bool>(&full_buffer), "Use a large buffer to host all the data points")
            ("do_dse", po::value<bool>(&do_dse), "Perform DSE")
            ("verbose", po::value<bool>(&verbose), "Printout intermediate results")
            ("print_design_space", po::value<bool>(&print_design_space_to_file), "Print out the valid design space into an output file")
            ("print_space", po::value<bool>(&do_print_ds), "Print out entire design space into a file")
            ("l1_size", po::value<int>(&l1_size), "L1 memory size in Bytes")
            ("l2_size", po::value<int>(&l2_size), "L2 memory size in Bytes")
            ("min_num_PEs", po::value<int>(&min_num_pes), "The max number of PEs during DSE")
            ("min_noc_bw", po::value<int>(&min_noc_bw), "The maximum noc bandwidth during DSE")
            ("max_num_PEs", po::value<int>(&max_num_pes), "The max number of PEs during DSE")
            ("max_noc_bw", po::value<int>(&max_noc_bw), "The maximum noc bandwidth during DSE")
            ("pe_tick", po::value<int>(&pe_tick), "The granularity of num PE search")
            ("bw_tick", po::value<int>(&bw_tick), "The granularity of bw search")
            ("area_constraint", po::value<double>(&area_cap), "Area budget")
            ("power_constraint", po::value<double>(&power_cap), "Power budget")
            ("optimization_target", po::value<std::string>(&optimization_target), "Optimization target (available options: runtime, energy, performance/energy)")
            ("do_schedule_only", po::value<bool>(&do_schedule_only), "Specify if a user wants to run only scheduler or not")
          ;


          po::options_description sched("Schedling options");
          sched.add_options()
            ("pe_partitioning_strategy", po::value<std::string>(&pe_partitioning_strategy), "PE Partitioning (available options: BruteForce, Uniform)")
            ("bw_partitioning_strategy", po::value<std::string>(&bw_partitioning_strategy), "BW Partitioning (available options: BruteForce, Uniform)")
            ("partitioning_strategy", po::value<std::string>(&partitioning_strategy), "Task partitioning strategy (available options: EnergyGreedy, LatencyGreedy, EDPGreedy)")
            ("ordering_strategy", po::value<std::string>(&ordering_strategy), "Task ordering strategy (available options: Interleaved, DependenceChain)")
            ("time_alignment_strategy", po::value<std::string>(&time_alignment_strategy), "Task time line construction strategy (available options: Standard, LookAhead)")
            ("lookahead_depth", po::value<int>(&lookahead_depth), "The size of look-ahead scheduling window")
          ;

          po::options_description all_options;
          all_options.add(desc);
          all_options.add(io);
          all_options.add(nocs);
          all_options.add(pe_array);
          all_options.add(problem);
          all_options.add(dse);
          all_options.add(sched);

          po::variables_map vm;
          po::store(po::parse_command_line(argc, argv, all_options), vm);
          po::notify(vm);

          return true;
      }
  }; //End of class Options
}; //End of namespace maestro
#endif

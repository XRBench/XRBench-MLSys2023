#ifndef HET_KEYWORDS_HPP_
#define HET_KEYWORDS_HPP_

#include <string>

namespace maestro {
  namespace HET {
    const std::string partition_strategy_energy_greedy = "EnergyGreedy";
    const std::string partition_strategy_latency_greedy = "LatencyGreedy";
    const std::string partition_strategy_edp_greedy = "EDPGreedy";
    const std::string partition_strategy_edp_balance = "EDPBalance";
    const std::string partition_strategy_ed2p_greedy = "ED2PGreedy";

    const std::string bw_partition_strategy_uniform = "Uniform";
    const std::string bw_partition_strategy_bruteforce = "BruteForce";

    const std::string pe_partition_strategy_uniform = "Uniform";
    const std::string pe_partition_strategy_bruteforce = "BruteForce";

    const std::string ordering_strategy_dependence_chaining = "DependenceChain";
    const std::string ordering_strategy_model_interleaving = "Interleaved";


    const std::string alignment_strategy_standard = "Standard";
    const std::string alignment_strategy_sequential = "Sequential";
    const std::string alignment_strategy_lookahead = "LookAhead";

  }; // End of namespace HET
}; // End of namespace maestro

#endif

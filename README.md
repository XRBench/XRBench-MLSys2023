# XRBench-MLSys2023
A version of XRBench-MAESTRO used for MLSys 2023 publication. 

# Dependencies
- scons
- libboost (Homebrew in a MAC) or libboost-all-dev (apt-get in a Linux machine)
- g++ or clang++

# How to compile
> scons

# How to run evaluation (Push button-style scripts)
> ./reproduce_figure5.sh
> ./reproduce_figure6.sh
> ./reproduce_figure7_data.sh

# Note
- The results are non-deterministic as the evaluation has dynamic factors (dynamic cascading of models in an ML pipeline).
- Deterministic results (Expect near-exact match): Social Interaction A, Soctial Interaction B, VR Gaming, and AR Gaming results of Figure 5
   
  -> Check "XRbench_evaluation/plots/4K/AR_gaming.pdf," "XRbench_evaluation/plots/8K/AR_gaming.pdf," ... (for each usage scenario)
- Another deterministic results: Figure 6
  
  -> Check "XRbench_evaluation/plots/AR_gaming___Dual_4K__WS_OS.pdf" and "XRbench_evaluation/plots/AR_gaming___Dual_8K__WS_OS.pdf" 

# Development Plan
- This version is tightly intergrated with MAESTRO. We plan to make it more modular so that XRBench can be plugged into other cost models and simulators as well. (The updates will be announced in our homepage https://xrbench.ai)

# Contact
If you have any questions, please reach out to us via info@xrbench.ai

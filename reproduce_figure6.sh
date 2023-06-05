./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/usage_scenarios/AR_gaming.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/dual/WS_OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/dual/Dual_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure6/sched_4K_AR_gaming.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure6/summary_4K_AR_gaming.csv' \
          --do_schedule_only=false 
 

./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/usage_scenarios/AR_gaming.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/dual/WS_OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/dual/Dual_8K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure6/sched_8K_AR_gaming.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure6/summary_8K_AR_gaming.csv' \
          --do_schedule_only=false 


python3 XRbench_evaluation/scripts/draw_timeline.py XRbench_evaluation/eval_data/schedule/schedule_AR_gaming__Dual_4K__WS_OS.csv XRbench_evaluation/plots/AR_gaming___Dual_4K__WS_OS.pdf 2 520
python3 XRbench_evaluation/scripts/draw_timeline.py XRbench_evaluation/eval_data/schedule/schedule_AR_gaming__Dual_8K__WS_OS.csv XRbench_evaluation/plots/AR_gaming___Dual_8K__WS_OS.pdf 2 520
          
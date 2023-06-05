
echo "4K PE, Accelerator Style B, 25% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_25p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/single/OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/single/Single_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccB__OS__VR_gaming_25p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccB__OS__VR_gaming_25p.csv' 
 
echo "4K PE, Accelerator Style B, 50% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_50p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/single/OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/single/Single_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccB__OS__VR_gaming_50p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccB__OS__VR_gaming_50p.csv' 

echo "4K PE, Accelerator Style B, 75% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_75p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/single/OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/single/Single_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccB__OS__VR_gaming_75p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccB__OS__VR_gaming_75p.csv' 


echo "4K PE, Accelerator Style B, 100% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_100p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/single/OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/single/Single_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccB__OS__VR_gaming_100p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccB__OS__VR_gaming_100p.csv' 



echo "4K PE, Accelerator Style J, 25% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_25p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/dual/WS_OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/dual/Dual_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccJ__WS_OS__VR_gaming_25p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccJ__WS_OS__VR_gaming_25p.csv' 

echo "4K PE, Accelerator Style J, 50% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_50p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/dual/WS_OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/dual/Dual_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccJ__WS_OS__VR_gaming_50p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccJ__WS_OS__VR_gaming_50p.csv' 


echo "4K PE, Accelerator Style J, 75% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_75p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/dual/WS_OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/dual/Dual_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccJ__WS_OS__VR_gaming_75p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccJ__WS_OS__VR_gaming_75p.csv' 


echo "4K PE, Accelerator Style J, 100% probability cascading of gaze estimation - eye segmentation pipeline"
./maestro --verbose=true \
          --full_buffer=false \
          --model_file='XRbench_evaluation/probability_sweep/VR_gaming_100p.m'  \
          --dataflow_file='XRbench_evaluation/dataflows/dual/WS_OS.m'  \
          --hw_file='XRbench_evaluation/hw_configs/dual/Dual_4K.m' \
          --XRBench_timeline_output_file_name='XRbench_evaluation/eval_data/figure7/sched__4K__AccJ__WS_OS__VR_gaming_100p.csv' \
          --XRBench_summary_output_file_name='XRbench_evaluation/eval_data/figure7/summary__4K__AccJ__WS_OS__VR_gaming_100p.csv' 

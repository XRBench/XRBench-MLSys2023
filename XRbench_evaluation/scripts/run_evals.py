import os
import glob

def GenerateExecCommand(
	hw_config_file_name,
	dataflow_config_file_name,
	usage_scenario_file_name,
	num_sub_accs_id
):

    num_sub_acc_prefix = ""

    if num_sub_accs_id == 0:
        num_sub_acc_prefix = "single/"
    elif num_sub_accs_id == 1:
        num_sub_acc_prefix = "dual/"
    elif num_sub_accs_id == 2:
        num_sub_acc_prefix = "quad/"
    else:
        pass

    hw_config = (hw_config_file_name.removeprefix("XRbench_evaluation/hw_configs/" + num_sub_acc_prefix)).removesuffix(".m")
    dataflow_config = (dataflow_config_file_name.removeprefix("XRbench_evaluation/dataflows/" + num_sub_acc_prefix)).removesuffix(".m")
    usage_scenario = usage_scenario_file_name.removeprefix("XRbench_evaluation/usage_scenarios/").removesuffix(".m")

    print("")
    print("===============")
    print(usage_scenario)
    print(hw_config)    
    print(dataflow_config)

    sched_output_file_name = "XRbench_evaluation/eval_data/schedule/schedule_" + usage_scenario + "__" + hw_config + "__" + dataflow_config + ".csv"
    summary_output_file_name = "XRbench_evaluation/eval_data/summary/summary_" + usage_scenario + "__" + hw_config + "__" + dataflow_config + ".csv"

    ret = "./maestro "
    ret += " --model_file='" + usage_scenario_file_name + "'"
    ret += " --dataflow_file='" + dataflow_config_file_name + "'"
    ret += " --hw_file='" + hw_config_file_name + "'"
    ret += " --XRBench_timeline_output_file_name='" + sched_output_file_name + "'"
    ret += " --XRBench_summary_output_file_name='" + summary_output_file_name + "'"

    return ret


def RunAllEvals():
    os.system("rm -rf XRbench_evaluation/eval_data/schedule/*")
    os.system("rm -rf XRbench_evaluation/eval_data/summary/*")


    acc_hw_config_files = []
    acc_hw_config_files.append(glob.glob("XRbench_evaluation/hw_configs/single/*"))
    acc_hw_config_files.append(glob.glob("XRbench_evaluation/hw_configs/dual/*"))
    acc_hw_config_files.append(glob.glob("XRbench_evaluation/hw_configs/quad/*"))

    datafow_config_files = []
    datafow_config_files.append(glob.glob("XRbench_evaluation/dataflows/single/*"))
    datafow_config_files.append(glob.glob("XRbench_evaluation/dataflows/dual/*"))
    datafow_config_files.append(glob.glob("XRbench_evaluation/dataflows/quad/*"))


    usage_scenario_files = glob.glob("XRbench_evaluation/usage_scenarios/*")


    for i in range(0,len(usage_scenario_files)):
    #for i in range(0,1):
        usage_scenario_file = usage_scenario_files[i]
        for j in range(0, 3):
        #for j in range(1, 2):        
            for k in range(0, len(acc_hw_config_files[j])):
                for l in range(0, len(datafow_config_files[j])):

                    hw_config_file = acc_hw_config_files[j][k]
                    dataflow_file = datafow_config_files[j][l]

                    exec_cmd = GenerateExecCommand(hw_config_file, dataflow_file, usage_scenario_file, j)
                    os.system(exec_cmd)


if __name__ == "__main__":
    RunAllEvals()
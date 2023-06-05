import matplotlib.pyplot as plt
import numpy as np
import glob
import string
import csv
import os

from math import pow

modelIDs = {
    "HT_hand_graph_cnn_half": 0,
    "ES_RITNet": 1,
    "GE_FBNet_C": 2,
    "KD_res8_narrow": 3,
    "ASR_EM_24L": 4,
    "SS_HRViT_b1": 5,
    "OD_D2go_FasterRCNN": 6,
    "D2go_FastRCNN": 6,
    "AS_ED_TCN": 7,
    "DE_midas_v21_small": 8,
    "DR_RGBd_200": 9,
    "PD_Plane_RCNN_Quarter": 10,
}

usageScenarioIDtoName = {
    0: "VR_gaming",
    1: "OutdoorA",
    2: "OutdoorB",
    3: "AR_gaming",
    4: "SocialA",
    5: "AR_Assistant",
    6: "SocialB",
}

numUsageScenarioModels = {
    "social_interactionA": 4,
    "social_interactionB": 3,
    "AR_gaming": 3,
    "outdoor_activity_A": 4,
    "outdoor_activity_B": 3,
    "VR_gaming": 3,
    "AR_Assistant": 6,
}

accSizeString = {
    2048: "2K",
    4096: "4K",
    8192: "8K",
    16384: "16K",
}

accSizesNum = [
#    2048,
    4096,
    8192,
#    16384,
]

dynamicSettingFolderName = {
    25: "25percent/",
    50: "25percent/",
    75: "25percent/",    
}


plot_path = "XRbench_evaluation/plots"


colorScheme = [
#    "#2D728F",
#    "#FFCA3A",
#    "#8AC926",
#    "#FF595E",    
    "#D5896F",
    "#DAB785",
    "#70A288",
    "#04395E",    
]

targetSettings2K = [
    "Single_2K__WS",
    "Single_2K__OS",
    "Single_2K__RS",
    "Dual_2K__WS_WS",
    "Dual_2K__OS_OS",
    "Dual_2K__RS_RS",
    "Quad_2K__WS_WS_WS_WS",
    "Quad_2K__OS_OS_OS_OS",
    "Quad_2K__RS_RS_RS_RS",
    "Dual_2K__WS_OS",
    "Dual_2K_BigLittle__WS_OS",
    "Dual_2K_LittleBig__WS_OS",
    "Quad_2K__WS_OS_WS_OS",
]

targetSettings4K = [
    "Single_4K__WS",
    "Single_4K__OS",
    "Single_4K__RS",
    "Dual_4K__WS_WS",
    "Dual_4K__OS_OS",
    "Dual_4K__RS_RS",
    "Quad_4K__WS_WS_WS_WS",
    "Quad_4K__OS_OS_OS_OS",
    "Quad_4K__RS_RS_RS_RS",
    "Dual_4K__WS_OS",
    "Dual_4K_BigLittle__WS_OS",
    "Dual_4K_LittleBig__WS_OS",
    "Quad_4K__WS_OS_WS_OS",
]

targetSettings8K = [
    "Single_8K__WS",
    "Single_8K__OS",
    "Single_8K__RS",
    "Dual_8K__WS_WS",
    "Dual_8K__OS_OS",
    "Dual_8K__RS_RS",
    "Quad_8K__WS_WS_WS_WS",
    "Quad_8K__OS_OS_OS_OS",
    "Quad_8K__RS_RS_RS_RS",
    "Dual_8K__WS_OS",
    "Dual_8K_BigLittle__WS_OS",
    "Dual_8K_LittleBig__WS_OS",
    "Quad_8K__WS_OS_WS_OS",
]

targetSettings16K = [
    "Single_16K__WS",
    "Single_16K__OS",
    "Single_16K__RS",
    "Dual_16K__WS_WS",
    "Dual_16K__OS_OS",
    "Dual_16K__RS_RS",
    "Quad_16K__WS_WS_WS_WS",
    "Quad_16K__OS_OS_OS_OS",
    "Quad_16K__RS_RS_RS_RS",
    "Dual_16K__WS_OS",
    "Dual_16K_BigLittle__WS_OS",
    "Dual_16K_LittleBig__WS_OS",
    "Quad_16K__WS_OS_WS_OS",
]


num_benchmark_models = 11


def GetNumSubAccPrefix(num_sub_accs_id):
    num_sub_acc_prefix = ""

    if num_sub_accs_id == 0:
        num_sub_acc_prefix = "single/"
    elif num_sub_accs_id == 1:
        num_sub_acc_prefix = "dual/"
    elif num_sub_accs_id == 2:
        num_sub_acc_prefix = "quad/"
    return num_sub_acc_prefix

def generate_grouped_bar_plots(acc_size, resolution, bar_width, preprocessed_data, dynamic_eval=False):

    rt_scores = preprocessed_data[0]
    en_scores = preprocessed_data[1]
    ux_scores = preprocessed_data[2]
    overall_scores = preprocessed_data[3]
    gross_avg_rt_scores = preprocessed_data[5]
    gross_avg_en_scores = preprocessed_data[6]
    gross_avg_ux_scores = preprocessed_data[7]
    gross_avg_oveall_scores = preprocessed_data[8]
    usage_scenario_names = preprocessed_data[9]

    assert(rt_scores.shape == en_scores.shape) # == num_usage_scenarios
    assert(ux_scores.shape == en_scores.shape)

    xbar_labels = list(string.ascii_uppercase)
    xbar_labels.append("AA")
    num_hw_settings = rt_scores.shape[1]

    print(num_hw_settings)
    x = np.arange(num_hw_settings)

    usage_scenario_iter_list = []
    if dynamic_eval:
        #usage_scenario_iter_list = [1,5]
        usage_scenario_iter_list = [0]
    else:
        usage_scenario_iter_list = range(0,7)

    for usage_scenario_id in usage_scenario_iter_list:
        usage_scenario_name = usage_scenario_names[usage_scenario_id]

        #if dynamic_eval:
        #    if usage_scenario_id == 1:
        #        usage_scenario_id = 0
        #    elif usage_scenario_id == 5:
        #        usage_scenario_id = 1

        print(usage_scenario_name + " mapped on " + str(usage_scenario_id))
        acc_size_string = accSizeString[acc_size]        
        output_file_name = plot_path + "/" + acc_size_string + "/" + usage_scenario_name  + ".pdf"

        plt.rcParams["figure.figsize"] = (resolution[0],resolution[1])
        #plt.setp(ax.spines.values(), linewidth=1)

        print("Processing " + output_file_name)

        # plot data in grouped manner of bar type
        print("RT Scores")
        print(rt_scores[usage_scenario_id])
        print("EN Scores")
        print(en_scores[usage_scenario_id])
        print("UX Scores")
        print(ux_scores[usage_scenario_id])

        plt.bar(x-1.5*bar_width, rt_scores[usage_scenario_id], width=bar_width, color=colorScheme[0])
        plt.bar(x-0.5*bar_width, en_scores[usage_scenario_id], width=bar_width, color=colorScheme[1])
        plt.bar(x+0.5*bar_width, ux_scores[usage_scenario_id], width=bar_width, color=colorScheme[2])                
        plt.bar(x+1.5*bar_width, overall_scores[usage_scenario_id], width=bar_width, color=colorScheme[3])                       
        plt.xticks(x, xbar_labels[0:num_hw_settings])
        plt.yticks([0,0.2,0.4,0.6,0.8,1.0], ["0", "0.2", "0.4", "0.6", "0.8", "1.0"])
        #plt.xlabel("Accelerator")
        #plt.ylabel("Scores")
        #plt.legend(["RT Score", "EN Score", "UX Score", "Overall Score"])
        #plt.show()
        print("Storing plot to " + output_file_name)
        plt.savefig(output_file_name, dpi=300, format="pdf", bbox_inches='tight') 
        plt.clf()

    gross_avg_output_file_name = plot_path + "/" + accSizeString[acc_size] + "/gross_average.pdf"
    plt.rcParams["figure.figsize"] = (resolution[0],resolution[1])

    plt.bar(x-1.5*bar_width, gross_avg_rt_scores, width=bar_width, color=colorScheme[0])
    plt.bar(x-0.5*bar_width, gross_avg_en_scores, width=bar_width, color=colorScheme[1])
    plt.bar(x+0.5*bar_width, gross_avg_ux_scores, width=bar_width, color=colorScheme[2])                
    plt.bar(x+1.5*bar_width, gross_avg_oveall_scores, width=bar_width, color=colorScheme[3])                       
    plt.xticks(x, xbar_labels[0:num_hw_settings])
    plt.yticks([0,0.2,0.4,0.6,0.8,1.0], ["0", "0.2", "0.4", "0.6", "0.8", "1.0"])
    #plt.xlabel("Accelerator")
    #plt.ylabel("Scores")
    #plt.legend(["RT Score", "EN Score", "UX Score", "Overall Score"])
    #plt.show()
    print("Storing plot to " + gross_avg_output_file_name)
    plt.savefig(gross_avg_output_file_name, dpi=300, format="pdf", bbox_inches='tight') 
    plt.clf()


def generate_dynamic_cascading_plot(acc_size, resolution, bar_width, preprocessed_data, dynamic_eval=False):

    rt_scores = preprocessed_data[0]
    en_scores = preprocessed_data[1]
    ux_scores = preprocessed_data[2]
    overall_scores = preprocessed_data[3]
    gross_avg_rt_scores = preprocessed_data[5]
    gross_avg_en_scores = preprocessed_data[6]
    gross_avg_ux_scores = preprocessed_data[7]
    gross_avg_oveall_scores = preprocessed_data[8]

    xbar_labels = list(string.ascii_uppercase)

    for usage_scenario_id in usage_scenario_iter_list:
        num_hw_settings = rt_scores.shape[1]

        print(num_hw_settings)
        x = np.arange(num_hw_settings)

        usage_scenario_iter_list = []
        if dynamic_eval:
            usage_scenario_iter_list = [1,5]
        else:
            usage_scenario_iter_list = range(0,7)

    for usage_scenario_id in usage_scenario_iter_list:

        usage_scenario_name = usageScenarioIDtoName[usage_scenario_id]

        if dynamic_eval:
            if usage_scenario_id == 1:
                usage_scenario_id = 0
            elif usage_scenario_id == 5:
                usage_scenario_id = 1
        print(usage_scenario_name + " mapped on " + str(usage_scenario_id))
        acc_size_string = accSizeString[acc_size]        
        output_file_name = plot_path + "/" + acc_size_string + "/" + usage_scenario_name  + ".pdf"

        plt.rcParams["figure.figsize"] = (resolution[0],resolution[1])
        #plt.setp(ax.spines.values(), linewidth=1)

        print("Processing " + output_file_name)

        # plot data in grouped manner of bar type
        print("RT Scores")
        print(rt_scores[usage_scenario_id])
        print("EN Scores")
        print(en_scores[usage_scenario_id])
        print("UX Scores")
        print(ux_scores[usage_scenario_id])

        plt.bar(x-1.5*bar_width, rt_scores[usage_scenario_id], width=bar_width, color=colorScheme[0])
        plt.bar(x-0.5*bar_width, en_scores[usage_scenario_id], width=bar_width, color=colorScheme[1])
        plt.bar(x+0.5*bar_width, ux_scores[usage_scenario_id], width=bar_width, color=colorScheme[2])                
        plt.bar(x+1.5*bar_width, overall_scores[usage_scenario_id], width=bar_width, color=colorScheme[3])                       
        plt.xticks(x, xbar_labels[0:num_hw_settings])
        plt.yticks([0,0.2,0.4,0.6,0.8,1.0], ["0", "0.2", "0.4", "0.6", "0.8", "1.0"])
        #plt.xlabel("Accelerator")
        #plt.ylabel("Scores")
        #plt.legend(["RT Score", "EN Score", "UX Score", "Overall Score"])
        #plt.show()
        print("Storing plot to " + output_file_name)
        plt.savefig(output_file_name, dpi=300, format="pdf", bbox_inches='tight') 
        plt.clf()




def parse_eval_data_fixed_settings(acc_size, dynamic_setting):

    acc_size_string = accSizeString[acc_size]
    acc_size_string_regex = "*" + acc_size_string + "*"

    taregetSettings = []
    usage_scenario_names = []

    if acc_size == 4096:
        taregetSettings = targetSettings4K
    elif acc_size == 8192:
        taregetSettings = targetSettings8K
    elif acc_size == 16384:
        taregetSettings = targetSettings16K
    elif acc_size == 2048:
        taregetSettings = targetSettings2K        
    else:
        print("Not supported acc_size. Applying 4K settings")
        taregetSettings = targetSettings4K

    num_hw_dataflow_settings = len(taregetSettings)

    usage_scenario_files = glob.glob("XRbench_evaluation/usage_scenarios/*")

    print("Parsed usage_scenario_files ")
    print(usage_scenario_files)

    dynamic_setting_name = ""
    if dynamic_setting != None and dynamic_setting >= 0:
        dynamic_setting_name = dynamicSettingFolderName[dynamic_setting]


    num_usage_scenarios = len(usage_scenario_files)
    
    rt_scores = np.zeros((num_usage_scenarios, num_benchmark_models, num_hw_dataflow_settings))
    en_scores = np.zeros((num_usage_scenarios, num_benchmark_models, num_hw_dataflow_settings))
    ux_scores = np.zeros((num_usage_scenarios, num_benchmark_models, num_hw_dataflow_settings))
    overall_scores = np.zeros((num_usage_scenarios, num_hw_dataflow_settings))
    num_usage_scenario_models = np.zeros(num_usage_scenarios)

    for i in range(0, num_usage_scenarios):
        usage_scenario_file_name = usage_scenario_files[i]
        usage_scenario = usage_scenario_file_name.removeprefix("XRbench_evaluation/usage_scenarios/").removesuffix(".m")
        usage_scenario_names.append(usage_scenario)
        num_usage_scenario_models[i] = numUsageScenarioModels[usage_scenario]

        setting_id = 0

        for j in range(0,num_hw_dataflow_settings):             
            summary_output_file_name = "XRbench_evaluation/eval_data/" + dynamic_setting_name + "summary/summary_" + usage_scenario + "__" + taregetSettings[setting_id] + ".csv"
            print(summary_output_file_name)

            if os.path.isfile(summary_output_file_name):
                is_first_line = True
                num_models_this_scenario = 0
                with open(summary_output_file_name, 'r') as current_csv_file:
                    summary_csv_reader = csv.reader(current_csv_file, delimiter=',')
                    for row in summary_csv_reader:
                        if is_first_line:
                            is_first_line = False
                        else:
                            if row[0] == "Overall Score":
                                overall_scores[i][setting_id] = float(row[1])
                            else:
                                num_models_this_scenario += 1
                                model_name = row[0]
                                model_id = modelIDs[model_name]

                                rt_scores[i][model_id][setting_id] = float(row[1])
                                en_scores[i][model_id][setting_id] = float(row[2])
                                ux_scores[i][model_id][setting_id] = float(row[3])
#                print("num models: " + str(N))
                if num_models_this_scenario != num_usage_scenario_models[i]:
                    overall_scores[i][setting_id] = overall_scores[i][setting_id] * num_models_this_scenario / num_usage_scenario_models[i]
            setting_id += 1

    en_scores_norm = en_scores
    overall_scores = overall_scores / 100

    avg_rt_scores = np.zeros((num_usage_scenarios, num_hw_dataflow_settings))
    avg_en_scores = np.zeros((num_usage_scenarios, num_hw_dataflow_settings))
    avg_ux_scores = np.zeros((num_usage_scenarios, num_hw_dataflow_settings))

    gross_avg_rt_scores = np.zeros(num_hw_dataflow_settings)
    gross_avg_en_scores = np.zeros(num_hw_dataflow_settings)
    gross_avg_ux_scores = np.zeros(num_hw_dataflow_settings)
    gross_avg_oveall_scores = np.zeros(num_hw_dataflow_settings)

    print("num_usage_scenario_models: " + str(num_usage_scenario_models))

    for i in range(0,num_usage_scenarios):
        for j in range(0, num_hw_dataflow_settings):
            for k in range(0,num_benchmark_models):
                #print("rt_scores[" + str(i) + "][" + str(k) + "][" + str(j) + "] = " + str(rt_scores[i][k][j]))
                avg_rt_scores[i][j] += rt_scores[i][k][j]
                avg_en_scores[i][j] += en_scores[i][k][j]
                avg_ux_scores[i][j] += ux_scores[i][k][j]
            #print("")
            #print("avg_rt_scores[ " + str(i) + "][" + str(j) + "] = " + str(avg_ux_scores[i][j]))
            avg_rt_scores[i][j] /= float(num_usage_scenario_models[i])
            #print("num_usage_scenario_models[" + str(i) + "] = " + str(num_usage_scenario_models[i]))
            avg_en_scores[i][j] /= float(num_usage_scenario_models[i])
            avg_ux_scores[i][j] /= float(num_usage_scenario_models[i])
            #print("After division, ")
            #print("avg_rt_scores[ " + str(i) + "][" + str(j) + "] = " + str(avg_ux_scores[i][j]))

            #print("avg_rt_scores[ " + str(i) + "][" + str(j) + "] = " + str(avg_ux_scores[i][j]))
            #avg_rt_scores[i][j] = pow(avg_rt_scores[i][j], num_usage_scenario_models[i])
            #avg_en_scores[i][j] = pow(avg_en_scores[i][j], num_usage_scenario_models[i])
            #avg_ux_scores[i][j] = pow(avg_ux_scores[i][j], num_usage_scenario_models[i])

    for j in range(0, num_hw_dataflow_settings):
        for i in range(0, num_usage_scenarios):
            gross_avg_rt_scores[j] +=  avg_rt_scores[i][j]
            gross_avg_en_scores[j] +=  avg_en_scores[i][j]
            gross_avg_ux_scores[j] +=  avg_ux_scores[i][j]
            gross_avg_oveall_scores[j] += overall_scores[i][j]

        gross_avg_rt_scores[j] /= float(num_usage_scenarios)
        gross_avg_en_scores[j] /= float(num_usage_scenarios)
        gross_avg_ux_scores[j] /= float(num_usage_scenarios)
        gross_avg_oveall_scores[j] /= float(num_usage_scenarios)

    return (avg_rt_scores, avg_en_scores, avg_ux_scores, overall_scores, num_usage_scenario_models, gross_avg_rt_scores, gross_avg_en_scores, gross_avg_ux_scores, gross_avg_oveall_scores, usage_scenario_names)

if __name__ == "__main__":
    dynamic_prob = None # 25, 50, 75
    dynamic_eval = False
    for acc_size in accSizesNum:
        parsed_data = parse_eval_data_fixed_settings(acc_size, dynamic_prob)
        bar_width = 0.2
        generate_grouped_bar_plots(acc_size, (12,5), bar_width, parsed_data, dynamic_eval)





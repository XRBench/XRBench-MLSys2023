import matplotlib.pyplot as plt
import numpy as np
import glob
import string
import csv
import os

from math import pow

dynamicSettingFolderName = {
    25: "25percent/",
    50: "25percent/",
    75: "25percent/",    
}


plot_path = "XRbench_evaluation/plots"


colorScheme = [
    "#D7233B",
    "#2D728F",
]


num_benchmark_models = 11


def generate_dynamic_cascading_plot(
	summary_csv_file_name = "XRbench_evaluation/eval_data/figure7/all_summary.csv",
	plot_path = "XRbench_evaluation/plots/",
	resolution = (12,5),
	bar_width = 0.2,
):
	scores = {
		"AccB": {
			"25P": [0,0,0,0],
			"50P": [0,0,0,0],
			"75P": [0,0,0,0],
			"100P": [0,0,0,0],
		},
		"AccJ": {
			"25P": [0,0,0,0],
			"50P": [0,0,0,0],
			"75P": [0,0,0,0],
			"100P": [0,0,0,0],
		},
	}

	with open(summary_csv_file_name, 'r') as data_csv_file:
		is_first_line = True
		summary_csv_reader = csv.reader(data_csv_file, delimiter=',')
		for row in summary_csv_reader:
			if is_first_line:
				is_first_line = False
			else:
				# RT Score
				scores[row[0]][row[1]][0] = float(row[2])
				# EN Score
				scores[row[0]][row[1]][1] = float(row[3])
				# QoE Score
				scores[row[0]][row[1]][2] = float(row[4])
				# XRBench Score
				scores[row[0]][row[1]][3] = float(row[5])


	scores_for_plotting = np.zeros((2,16))

	# RT Score
	scores_for_plotting[0][0] = scores["AccB"]["25P"][0]
	scores_for_plotting[0][1] = scores["AccB"]["50P"][0]
	scores_for_plotting[0][2] = scores["AccB"]["75P"][0]
	scores_for_plotting[0][3] = scores["AccB"]["100P"][0]

	scores_for_plotting[1][0] = scores["AccJ"]["25P"][0]
	scores_for_plotting[1][1] = scores["AccJ"]["50P"][0]
	scores_for_plotting[1][2] = scores["AccJ"]["75P"][0]
	scores_for_plotting[1][3] = scores["AccJ"]["100P"][0]

    # EN Score
	scores_for_plotting[0][4] = scores["AccB"]["25P"][1]
	scores_for_plotting[0][5] = scores["AccB"]["50P"][1]
	scores_for_plotting[0][6] = scores["AccB"]["75P"][1]
	scores_for_plotting[0][7] = scores["AccB"]["100P"][1]

	scores_for_plotting[1][4] = scores["AccJ"]["25P"][1]
	scores_for_plotting[1][5] = scores["AccJ"]["50P"][1]
	scores_for_plotting[1][6] = scores["AccJ"]["75P"][1]
	scores_for_plotting[1][7] = scores["AccJ"]["100P"][1]

	# QoE Score
	scores_for_plotting[0][8] = scores["AccB"]["25P"][2]
	scores_for_plotting[0][9] = scores["AccB"]["50P"][2]
	scores_for_plotting[0][10] = scores["AccB"]["75P"][2]
	scores_for_plotting[0][11] = scores["AccB"]["100P"][2]

	scores_for_plotting[1][8] = scores["AccJ"]["25P"][2]
	scores_for_plotting[1][9] = scores["AccJ"]["50P"][2]
	scores_for_plotting[1][10] = scores["AccJ"]["75P"][2]
	scores_for_plotting[1][11] = scores["AccJ"]["100P"][2]

	# XRBench Score
	scores_for_plotting[0][12] = scores["AccB"]["25P"][3]
	scores_for_plotting[0][13] = scores["AccB"]["50P"][3]
	scores_for_plotting[0][14] = scores["AccB"]["75P"][3]
	scores_for_plotting[0][15] = scores["AccB"]["100P"][3]

	scores_for_plotting[1][12] = scores["AccJ"]["25P"][3]
	scores_for_plotting[1][13] = scores["AccJ"]["50P"][3]
	scores_for_plotting[1][14] = scores["AccJ"]["75P"][3]
	scores_for_plotting[1][15] = scores["AccJ"]["100P"][3]

	output_file_name = plot_path + "figure7_base" + ".pdf"

	xbar_labels = list(string.ascii_uppercase)
	x = np.arange(16)

	plt.rcParams["figure.figsize"] = (resolution[0],resolution[1])

	plt.bar(x-0.7*bar_width, scores_for_plotting[0], width=bar_width, color=colorScheme[0])
	plt.bar(x+0.7*bar_width, scores_for_plotting[1], width=bar_width, color=colorScheme[1])                
	#plt.xticks(x, xbar_labels[0:15])
	plt.yticks([0,0.2,0.4,0.6,0.8,1.0], ["0", "0.2", "0.4", "0.6", "0.8", "1.0"])
	print("Storing plot to " + output_file_name)
	plt.savefig(output_file_name, dpi=300, format="pdf", bbox_inches='tight', transparent=True) 
	plt.clf()



if __name__ == "__main__":
	generate_dynamic_cascading_plot()
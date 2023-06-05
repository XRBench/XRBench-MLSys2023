
import csv
import os

data_path = "XRbench_evaluation/eval_data/figure7/"

filename_prefix = "summary__4K__"
workload_name = "VR_gaming_"


ACC_B_TAG = "AccB__OS__"
ACC_J_TAG = "AccJ__WS_OS__"
acc_tags = [ACC_B_TAG, ACC_J_TAG]

PROB_25_TAG = "25p"
PROB_50_TAG = "50p"
PROB_75_TAG = "75p"
PROB_100_TAG = "100p"
probabilities = [PROB_25_TAG, PROB_50_TAG, PROB_75_TAG, PROB_100_TAG]

overall_scores = []
rt_scores = [[0] * 3]

# RT, EN, UE, Overall, COUNT
Log = {
	ACC_B_TAG: {},
	ACC_J_TAG: {}
}

Log[ACC_B_TAG] = {
	PROB_25_TAG: [0, 0, 0, 0, 0],
	PROB_50_TAG: [0, 0, 0, 0, 0],
	PROB_75_TAG: [0, 0, 0, 0, 0],
	PROB_100_TAG: [0, 0, 0, 0, 0],	
}

Log[ACC_J_TAG] = {
	PROB_25_TAG: [0, 0, 0, 0, 0],
	PROB_50_TAG: [0, 0, 0, 0, 0],
	PROB_75_TAG: [0, 0, 0, 0, 0],
	PROB_100_TAG: [0, 0, 0, 0, 0],		
}

N = 0

for acc in acc_tags:
	for prob in probabilities:
		file_name = data_path + filename_prefix + acc + workload_name + prob + ".csv"
		print(N)
		N += 1
		if os.path.isfile(file_name):
			with open(file_name, 'r') as current_csv_file:
				for row in current_csv_file:
					split_row = row.split(",")
					if split_row[0] == "Overall Score":
						Log[acc][prob][3] += float(split_row[1])
						Log[acc][prob][4] += 1
					elif split_row[0] == "Model Name":
						continue
					else:
						Log[acc][prob][0] += float(split_row[1])
						Log[acc][prob][1] += float(split_row[2])
						Log[acc][prob][2] += float(split_row[3])


for acc in acc_tags:
	for prob in probabilities:
		Log[acc][prob][0] /= (3 * Log[acc][prob][4])
		Log[acc][prob][1] /= (3 * Log[acc][prob][4])
		Log[acc][prob][2] /= (3 * Log[acc][prob][4])
		Log[acc][prob][3] /= (Log[acc][prob][4] * 100)


fig7_data_filename = data_path + "all_summary.csv"

with open(fig7_data_filename, 'w') as res_csv_file:
	writer = csv.writer(res_csv_file)
	writer.writerow(["Accelerator", "Prob", "RT Score", "EN Score", "UX Score", "Overall Score"])
	writer.writerow(["AccB", "25P", str(Log[ACC_B_TAG][PROB_25_TAG][0]),str(Log[ACC_B_TAG][PROB_25_TAG][1]), str(Log[ACC_B_TAG][PROB_25_TAG][2]), str(Log[ACC_B_TAG][PROB_25_TAG][3])])
	writer.writerow(["AccB", "50P", str(Log[ACC_B_TAG][PROB_50_TAG][0]),str(Log[ACC_B_TAG][PROB_50_TAG][1]), str(Log[ACC_B_TAG][PROB_50_TAG][2]), str(Log[ACC_B_TAG][PROB_50_TAG][3])])
	writer.writerow(["AccB", "75P", str(Log[ACC_B_TAG][PROB_75_TAG][0]),str(Log[ACC_B_TAG][PROB_75_TAG][1]), str(Log[ACC_B_TAG][PROB_75_TAG][2]), str(Log[ACC_B_TAG][PROB_75_TAG][3])])
	writer.writerow(["AccB", "100P", str(Log[ACC_B_TAG][PROB_100_TAG][0]),str(Log[ACC_B_TAG][PROB_100_TAG][1]), str(Log[ACC_B_TAG][PROB_100_TAG][2]), str(Log[ACC_B_TAG][PROB_100_TAG][3])])
	writer.writerow(["AccJ", "25P", str(Log[ACC_J_TAG][PROB_25_TAG][0]),str(Log[ACC_J_TAG][PROB_25_TAG][1]), str(Log[ACC_J_TAG][PROB_25_TAG][2]), str(Log[ACC_J_TAG][PROB_25_TAG][3])])
	writer.writerow(["AccJ", "50P", str(Log[ACC_J_TAG][PROB_50_TAG][0]),str(Log[ACC_J_TAG][PROB_50_TAG][1]), str(Log[ACC_J_TAG][PROB_50_TAG][2]), str(Log[ACC_J_TAG][PROB_50_TAG][3])])
	writer.writerow(["AccJ", "75P", str(Log[ACC_J_TAG][PROB_75_TAG][0]),str(Log[ACC_J_TAG][PROB_75_TAG][1]), str(Log[ACC_J_TAG][PROB_75_TAG][2]), str(Log[ACC_J_TAG][PROB_75_TAG][3])])
	writer.writerow(["AccJ", "100P", str(Log[ACC_J_TAG][PROB_100_TAG][0]),str(Log[ACC_J_TAG][PROB_100_TAG][1]), str(Log[ACC_J_TAG][PROB_100_TAG][2]), str(Log[ACC_J_TAG][PROB_100_TAG][3])])



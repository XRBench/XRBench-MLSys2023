# Importing the matplotlib.pyplot
import matplotlib.pyplot as plt
import csv
import sys

colorScheme = [
        "#2D728F",
        "#FFCA3A",
        "#8AC926",
        "#FF595E",    
        "#D5896F",
        "#DAB785",
        "#70A288",
        "#04395E",    
    ]


def draw_timeline_figure(
    input_csv_file_name,
    output_figure_file_name,
    num_accs,
    duration
):
 
    print("Draw timeline figure")
    # Declaring a figure "gnt"
    fig, gnt = plt.subplots()
     
    # Setting Y-axis limits
    gnt.set_ylim(0, num_accs)
     
    # Setting X-axis limits
    gnt.set_xlim(0, duration * 1.1)
     
    # Setting labels for x-axis and y-axis
    gnt.set_xlabel('Time (ms)')
    gnt.set_ylabel('Accelerator')

    yticks = [i for i in range(0, num_accs+2)]
    yticklabes = [""] + [ ("acc " + str(i)) for i in range(0, num_accs)] + [""]



    color_list = ['tab:orange', 'tab:blue', 'tab:red', 'tab:green', 'tab:purple', 'tab:brown', 'tab:olive']
    model_name_list = []
     
    # Setting ticks on y-axis
    #gnt.set_yticks([15, 25, 35])
    gnt.set_yticks(yticks)
    # Labelling tickes of y-axis
    #gnt.set_yticklabels(['1', '2', '3'])
    gnt.set_yticklabels(yticklabes)
     
    # Setting graph attribute
    gnt.grid(True)

    with open(input_csv_file_name) as input_csv_file:
        csv_reader = csv.reader(input_csv_file, delimiter=',')
        line_count = 0
        for row in csv_reader:
            if line_count != 0:
                acc_id = float(row[0])
                model_name = row[1]
                frame_id = int(row[2])
                injection_time = float(row[3])
                dispatch_time = float(row[4])
                deadline_time = float(row[5])
                completion_time = float(row[6])

                color_Id = 0
                bar_color =''
                if not model_name in model_name_list:
                    model_name_list.append(model_name)

                model_idx = model_name_list.index(model_name)
                color_Id = model_idx 
                bar_color = colorScheme[color_Id]

                gnt.broken_barh(
                    [(dispatch_time, completion_time - dispatch_time)],
                    (acc_id+0.7, 0.6),
                    facecolors=(bar_color)
                )


            line_count += 1


    plt.savefig(output_figure_file_name)


if __name__ == "__main__":
    if len(sys.argv) == 5 and sys.argv[1].endswith(".csv"): # and sys.argv[2].endswith(".pdf") and isinstance(sys.argv[3],int) and sys.argv[3] > 0 and isinstance(sys.argv[4],int) and sys.argv[4] > 0 :
        input_csv_file_name = sys.argv[1]
        output_figure_file_name = sys.argv[2]
        num_accs = int(sys.argv[3])
        duration = int(sys.argv[4])
        draw_timeline_figure(input_csv_file_name, output_figure_file_name, num_accs, duration)

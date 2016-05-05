##########################################################################################
# Scatter Plot visualizer, visualizes results across 2d scatter plot

# The strategy here is to load the weights saved during training,
# create a new rnn with these saved weights, then present the inputs
# using the forward() function (this simply returns the activations given an input)
# then plot these activations.
##########################################################################################

import ast
import copy
import pickle
# import random
import math

import matplotlib
matplotlib.use("TkAgg")

import matplotlib.pyplot as plt
import pylab

import time
from scipy.special import expit
import numpy as np
from pprint import pprint
import sys
from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN
import utility as util
import experiment as e

def onclick(event):
    global pause
    pause = not pause

########################################
# Formatting for the interactive figure
########################################
pylab.ion()
fig = pylab.figure()
pause = False
fig.canvas.mpl_connect('button_press_event', onclick)

# argumetns:
# wFile - file of weights from training
# inputFile - file with inputs and targets to test on
# imageName - name of imageName you wish to name the image, default = "defaultScatter"
def scatter(exp, imageFile=None, test=False):
    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    if imageFile is None:
        imageFile = "defaultScatter.png"

    rnn = exp.rnn

    #create an output file for the activations. I don't actually use this yet.
    # out2 = open("activations", "wb+")

    # shows activations for each time step for each input

    print np.shape(targets)

    colors = ["r", "b", "c", "g", "k", "y", "m", "orange"]

    index = 0
    ci = 0
    print len(inputs)

    while True:
        if not pause:

            plt.clf() # clear the plot

            j = np.asarray(inputs[index])
            t = targets[index]
            i = inputs[index]

            try:
                info = ast.literal_eval(ret['inputNames'][index])
                title = "Selection: " + str(info['inputs']['choice']) + \
                ", Cue 1: " + str(info['inputs']['cue1']) + \
                        ", Cue 2: " + str(info['inputs']['cue2'])
            except:
                title = ret['inputNames'][index]

            plt.title("Trial #: " + str(index) + ", " + title)

            try:
                info = ast.literal_eval(ret['inputNames'][index])
                if info['inputs']['choice'] == 1:
                    ci = info['inputs']['cue1'] % len(colors)
                elif info['inputs']['choice'] == 2:
                    ci = info['inputs']['cue2'] % len(colors)
                else:
                    raise NameError("Here??")
            except:
                pass

            out = rnn.forward(j, rnn.W)[-1]

            out = out[:, 0, :]

            color = colors[ci % len(colors)]

            for x in range(len(out)):
                x_val = t[x][0] - t[x][1]
                y_val = t[x][2] - t[x][3]

                plt.scatter(x_val, y_val, s=100, c=color, marker='s')

                x_val = out[x][0] - out[x][1]
                y_val = out[x][2] - out[x][3]

                plt.scatter(x_val, y_val, s=40, c=color)

            # print t[x]

            plt.axis([-1.2, 1.2, -1.2, 1.2])
            plt.axhline(linewidth=0.5, color="black")
            plt.axvline(linewidth=0.5, color="black")
            plt.draw()
            plt.pause(1)
            index += 1
            if index >= len(targets):
                pylab.savefig(dataPath + imageFile)
                plt.pause(100)
                break
            fig.canvas.flush_events()

        fig.canvas.get_tk_widget().update() # process events
        # plt.show()

def main():
    exp = e.experiment()


    # scatter(sys.argv[1])
    # scatter("experiments/selection106/selection106.exp")
    # scatter("exps_set2/combined246/combined246.exp")

    exp.read("exps_set3/combined63/combined63.exp", loadW=True)

    scatter(exp)

if __name__ == "__main__":
    main()
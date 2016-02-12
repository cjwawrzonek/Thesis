##########################################################################################
# Activations visualizer. Creates matlab based color map 
# of the hidden layer activations

# The strategy here is to load the weights saved during training,
# create a new rnn with these saved weights, then present the inputs
# using the forward() function (this simply returns the activations given an input)
# then plot these activations.
##########################################################################################

import copy
import pickle
import random
import math

import matplotlib.pyplot as plt
import time
from scipy.special import expit
import numpy as np
from pprint import pprint
import sys
from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN

def question(question, default="yes"):
    valid = {"yes": True, "y": True, "ye": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = raw_input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")

extended = True
default = question("Use the default files? Type 'N' to use new weights and inputs.", "yes")
if default == True:
    delayed = question("Use the fixed length delay? Type 'N' to see varied delay length.", "yes")
    if delayed == False:
        extended = question("See extended inputs? Type 'N' to see shorter inputs", 'yes')
## Take in a the weights file
if default == True:
    if delayed == True:
        wFileString = "Old_Results/W_12x12_sigma_4"
    elif extended == True:
        wFileString = "Old_Results/W_varied_extended"
    else:
        wFileString = "Old_Results/W_varied_retrained"
else:
    wFileString = "Old_Results/W"
    
wfile = open(wFileString, "rb+")

line = wfile.readline()
line = line.replace("[", "")
line = line.replace("]", "")
line = line.replace("\n", "")
line = line.split(",")
lay = [int(x) for x in line]

wfile.close()

# This is the file of inputs to observe the activations.
if default == True:
    if delayed == True:
        fstim = open("Old_Inputs/DSTrainFixed.txt", "rb+")
    elif extended == True:
        fstim = open("Old_Inputs/DelayedSaccadeTrain_extended.txt", 'rb')
    else:
        fstim = open("Old_Inputs/DelayedSaccadeTrain_retrained.txt", 'rb')
else:
    fstim = open("Old_Inputs/DelayedSaccadeTrain.txt")

# swallow everything in memory
block = fstim.read()
lines = block.split("\n")
fstim.close()
# free our in-core file copy asap
del block

## meta data on the inputs that I store at the top
total_inputs = int(lines[0]) # total number of weights (all layers combined)
stim_len = int(lines[1]) # length of stimulus during trial
stim_dim = int(lines[2]) # dimension of the stimulus
max_delay = int(lines[3]) # maximum amount of time the stimulus must delay (this varies)
resp_len = int(lines[4]) # length of response time
num_targets = int(lines[5]) # number of targets (12 by default)

trial_time = stim_len + max_delay + resp_len

# Remake the inputs and targets
#############################################
inputs = np.asarray([[[0 for k in range(stim_dim + 2)] \
    for j in range(trial_time)] \
    for l in range(total_inputs)], dtype=np.float32)

targets = np.asarray([[[0 for k in range(num_targets)] \
    for j in range(trial_time)] \
    for l in range(total_inputs)], dtype=np.float32)

input_types = np.asarray([0 for k in range(total_inputs)], dtype=np.dtype((str, 20)))
target_types = np.asarray([0 for k in range(total_inputs)], dtype=np.dtype((str, 20)))

index = 6
for trial in range(total_inputs):
    #first, the input set
    # print lines[index]
    input_types[trial] = lines[index]
    index += 1
    # pars = title.split("-")
    for temp in range(trial_time):
        row = np.array(lines[index].split(' '))
        data = row.astype(np.float32)
        index += 1
        inputs[trial][temp] = data

    assert(lines[index] == 'end') # verify where we are
    index += 1

    #then the output set
    target_types[trial] = lines[index]
    index += 1
    for temp in range(trial_time):
        row = np.array(lines[index].split(' '))
        try:
            data = row[0:num_targets].astype(np.float32)
        except:
            print row
            exit()
        index += 1
        targets[trial][temp] = data

    assert(lines[index] == 'end') # verify where we are
    index += 1
########################################################

# create a recurrent NN
rnn = HessianRNN(layers=[lay[0], lay[1], lay[3]], struc_damping=0.5,
             use_GPU=False, debug=False, loadW = wFileString)

#create an output file for the activations. I don't actually use this yet.
# out2 = open("activations", "wb+")

# shows activations for each time step for each input
index = 1
for i, t in zip(inputs, targets):
    j = np.asarray(i)
    
    # print >> out2, "\nTrail Num: {}".format(index)
    index += 1
    hidden = rnn.forward(j, rnn.W)[-2]
    out = rnn.forward(j, rnn.W)[-1]
    # for x in range(len(output)):
    #     for y in range(len(output[x][0])):
    #         if output[x][0][y] < 0.001:
    #             output[x][0][y] = 0
    hidden = hidden[:, 0, :]
    out = out[:, 0, :]
    side = int(math.sqrt(len(hidden[0])))
    hidden_sqr = np.zeros((side, side))
    for x in range(len(hidden)):
        plt.subplot(4, 4, x + 1) # the sublpot is 4x4 because the trial has 13 time steps (smallest perfect squre > 13)
        for y in range(side):
            hidden_sqr[y, :] = hidden[x][side*y:(side*y + side)]
            print (side*y + side)
        plt.pcolor(hidden_sqr)
        plt.colorbar()
        
        # time.sleep(1)
    plt.show()

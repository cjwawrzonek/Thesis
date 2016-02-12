##########################################################################################
# Reduces the activations of the hidden layer using sklearn's principle component analysis
# functions. Reduces along the dimension of each trial and along the dimension of each
# time step.

##########################################################################################
import copy
import pickle
import random
import math

import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
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

#again, load the weights file from training. This changes depending on your file.
extended = True # just by default
default = question("Use the default files? Type 'N' to use new weights and inputs.", "yes")
if default == True:
	delayed = question("Use the fixed length delay? Type 'N' to see varied delay length.", "yes")
	if delayed == False:
		extended = question("See extended inputs? Type 'N' to see shorter inputs", 'yes')
## Take in a the weights file
if default == True:
	if delayed == True:
		wfile = open("W_12x12_sigma_5", "rb+")
	elif extended == True:
		wfile = open("W_varied_extended", "rb+")
	else:
		wfile = open("W_varied_retrained", "rb+")
else:
	wfile = open("W", "rb+")

line = wfile.readline()
line = line.replace("[", "")
line = line.replace("]", "")
line = line.replace("\n", "")
line = line.split(",")
lay = [int(x) for x in line]

wfile.close()

# Inputs to produce activations. This file name changes as well.
if default == True:
	if delayed == True:
		fstim = open("DSTrainFixed.txt", "rb+")
	elif extended == True:
		fstim = open("DelayedSaccadeTrain_extended.txt", 'rb')
	else:
		fstim = open("DelayedSaccadeTrain_retrained.txt", 'rb')
else:
	fstim = open("DelayedSaccadeTrain.txt")

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
######################################################

# create a new rnn with the loaded w weights
rnn = HessianRNN(layers=[lay[0], lay[1], lay[3]], struc_damping=0.5,
             use_GPU=False, debug=False, loadW = True)

index = 1
all_acts = []
acts = np.zeros((len(inputs[0]), int(lay[1])))

for i, t in zip(inputs, targets):
	j = np.asarray(i)
	index += 1
	hidden = rnn.forward(j, rnn.W)[-2]
	# out = rnn.forward(j, rnn.W)[-1]
	# for x in range(len(output)):
	#     for y in range(len(output[x][0])):
	#         if output[x][0][y] < 0.001:
	#             output[x][0][y] = 0
	hidden = hidden[:, 0, :]

	# print(acts[12 comps, neuron features])
	acts = hidden
	all_acts.append(acts)
	# for x in range(len(out)):
	# 	print out[x]
	# 	plt.pcolor(out)
	# 	plt.colorbar()
	# 	plt.show()
	# 	time.sleep(1)

# acts_reduced = np.zeros((len(inputs[0]), 2))
all_reduced = []
count = 1

# PCA object
# This is obviously the number of principle components you want to see
pca = PCA(n_components=2)

# So this is is used if you want to discriminate which input length you use in the pca
# as it stands now, it uses all 4 delay lengths (5,6,7,8), but you can remove numbers
# below to only use a subset of delay lengths in the pca analysis
es = []
for x in range(len(input_types)):
	num = int(input_types[x].split("-")[2])
	if num == 6 or num == 5 or num == 7 or num == 8:
		es.append(x)

#############################################################
#plotting with respect to time

# This is a pca along the length of a trial of each input.
# You can do this two ways. With each each PC along the two axes,
# or you can have the x axis be time and the y axis be the activations
# of the two components. Change with the variable by_time.
############################################################# 

vec = [True, False]
for by_time in vec:
	count = 1
	for i in range(len(all_acts)):
		# print count
		plt.subplot(5, 5, count) # hard coded because I was using
		# ~22 trials in my final analysis. feel free to change to make it look pretty

		count += 1
		x = []
		y = []
		# stuff = []
		stuff = np.zeros((len(inputs[0]), 2))
		acts_8 = []

		pca.fit(all_acts[i])
		acts_reduced = pca.transform(all_acts[i])
		all_reduced.append(acts_reduced)
		acts_reduced = np.asarray(acts_reduced)
		stuff[:, 0] = acts_reduced[:, -2]
		stuff[:, 1] = acts_reduced[:, -1]
		stuff = np.asarray(stuff)
		for coor in acts_reduced:
			x.append(coor[0])
			y.append(coor[1])

		if by_time:
			plt.plot(stuff)
		else:
			plt.plot(x, y)

	plt.show()


#############################################################
#plotting with respect to each time steop

# This is a pca along the each time step across all trials.
# You can do this two ways as well. One way will show you the
# the variance explained along the 12 major PCs, and one will
# plot the top 2 PCs along each time step. Change this with
# show_pcs.
############################################################# 
for show_pcs in vec:

	if show_pcs == True:
		pca2 = PCA(n_components=2)
	else:
		pca2 = PCA(n_components=12)

	count = 1

	print len(inputs[0])
	for i in range(len(inputs[0])):
		# break
		plt.subplot(4, 4, count)
		count += 1
		x = []
		y = []

		all_acts = np.asarray(all_acts)
		step = all_acts[:, i]
		step2 = step[es] # here, we select only the trial numbers we want

		step = np.asarray(step)
		step2 = np.asarray(step2)


		pca2.fit(step2)
		step_reduced = pca2.transform(step2)

		if show_pcs == True:
			plt.plot(step_reduced)
		else:
			plt.plot(pca2.explained_variance_ratio_)
		####################

	plt.show()


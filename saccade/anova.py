##########################################################################################
# Anova analysis of hidden unit activations
##########################################################################################

import ast
import copy
import pickle
import random
import math

import matplotlib
matplotlib.use("TkAgg")

import matplotlib.pyplot as plt
import pylab

import time
from scipy.special import expit
from scipy.stats import f_oneway
import numpy as np
from pprint import pprint
import sys
from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN
import utility as util
from mpl_toolkits.mplot3d import Axes3D

####################################################################################

random.seed()

########################################
# Formatting for the interactive figure
########################################
def onclick(event):
    global pause
    pause = not pause


# argumetns:
# wFile - file of weights from training
# inputFile - file with inputs and targets to test on
# imageName - name of imageName you wish to name the image, default = "anova+label.png"
def anova(dataPath, wFile, inputFile, imageFile=None):
    if imageFile is None:
        imageFile = "anova.png"

    if not dataPath.endswith('/'):
        dataPath += '/'
        
    ret = util.readInputs(dataPath + inputFile)

    ##########################################################
    # must find way to generalize this value
    numLocations = 8
    pval = 0.05
    ##########################################################

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = HessianRNN(layers=[len(inputs[0][0]), 144, len(targets[0][0])], struc_damping=0.5,
                 use_GPU=False, debug=False, loadW=wFile, dataPath=dataPath)

    np.set_printoptions(edgeitems = 10)

    #create an output file for the activations. I don't actually use this yet.
    # out2 = open("activations", "wb+")

    locTrials = [list([]) for _ in range(numLocations)]
    cue1locTrials = [list([]) for _ in range(numLocations)]
    cue2locTrials = [list([]) for _ in range(numLocations)]
    choices = [list([]) for _ in range(2)]
    trialMeans = [];

    # The trial mean firing rates for the delay period alone
    trialMeansDelayOnly = []

    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])

        try:
            info = ast.literal_eval(ret['inputNames'][trial])
        except:
            pass

        # compute activations and select the hidden layer
        hidden = rnn.forward(j, rnn.W)[1]

        # eliminate this extra dimension from the outputs.
        # still not exactly sure what this dimension is
        hidden = hidden[:, 0, :]

        means = [];

        # This "meansDelayOnly" is the mean firing rate for the delay period only
        meansDelayOnly = []
        for unit in range(len(hidden[0])):
            means.append(np.mean(hidden[:, unit]))
            meansDelayOnly.append(np.mean(hidden[-10:-5, unit]))

        trialMeansDelayOnly.append(meansDelayOnly)
        trialMeans.append(means)

        loc1 = info['inputs']['cue1']
        loc2 = info['inputs']['cue2']
        choice = info['inputs']['choice'] - 1

        locTrials[loc1].append(trial)
        locTrials[loc2].append(trial)
        choices[choice].append(trial)
        cue1locTrials[loc1].append(trial)
        cue2locTrials[loc2].append(trial)

    count = 0
    for neuron in range(len(trialMeans[0])):
        loc0 = locTrials[0]
        loc1 = locTrials[1]

        sample1=[]
        sample2=[]

        for trial in choices[0]:
            sample1.append(trialMeans[trial][neuron])
        for trial in choices[1]:
            sample2.append(trialMeans[trial][neuron])

        ans = f_oneway(sample1, sample2)

        if ans.pvalue < pval:
            count += 1
            # print ans
            # print neuron
    print "# sig neurons that prefer choice selection (1st or 2nd loc,): {}, pval < {}".format(count, pval)
    print

    # number of significant neurons prefering that direction
    numSigLoc = np.zeros(numLocations)

    # some relevant neurons, just a list of some significant ones
    sigNeurons = []

    for loc in range(numLocations):
        for neuron in range(len(trialMeans[0])):
            sample1=[]
            sample2=[]

            for trial in locTrials[loc]:
                sample1.append(trialMeans[trial][neuron])
            for loc2 in range(numLocations):
                if loc2 is not loc:
                    for trial in locTrials[loc2]:
                        sample2.append(trialMeans[trial][neuron])

            ans = f_oneway(sample1, sample2)

            if ans.pvalue < pval:
                numSigLoc[loc] += 1
                sigNeurons.append(neuron)

    message = "# sig neurons per location: ["
    for loc in range(len(numSigLoc)):
        message = message + str(numSigLoc[loc]) + ", "
    message = message[:-2]
    message = message + "], pval < {}".format(pval)

    print message
    print

    # sample1=[]
    # sample2=[]
    # sample3=[]
    # neuron = 88
     # loc0 = 0
    # loc1 = 1
    # for trial in locTrials[loc1]:
    #     sample1.append(trialMeans[trial][neuron])
    # for trial in locTrials[loc2]:
    #     sample2.append(trialMeans[trial][neuron])
    # for trial in choices[0]:
    #     sample3.append(trialMeans[trial][neuron])
    # fig = plt.figure()
    # ax = fig.add_subplot(111, projection='3d')
    # ax.scatter(sample1, sample2, sample3)
    # plt.show()
    # exit()


    ##########################################################
    # 3d F-stat plots
    ##########################################################

    # trialMeans = trialMeansDelayOnly

    # cue1Fs = [list([]) for _ in range(len(trialMeans[0]))]
    # cue2Fs = [list([]) for _ in range(len(trialMeans[0]))]
    # cueDiffFs = [list([]) for _ in range(len(trialMeans[0]))]
    cue1Fs = []
    cue2Fs = []
    cueDiffFs = []

    # This tracks the "pvalue class" of each point. Basically, how significant
    # were the f-statistics to change the markers to match significance
    pvalClass = []

    # Particularly signficant neurons that may be good to look at
    sigNeurons = []

    ###### Compile 3 groups: ########
    # cue1Fs : F-stat of 1x8 anova for each neuron's mean firing rate for each
        # trial in which location 'x' appears at cue 1
    # cue2Fs : F-stat of 1x8 anova for each neuron's mean firing rate for each
        # trial in which location 'x' appears at cue 2
    # cueDiffFs : F-stat of 1x2 anova for each neurons' mean firing rate for 2
        # groups, split between cue 1 and cue 2
    for neuron in range(len(trialMeans[0])):

        # Some seriously sloppy coding. There has to be a better way of doing this
        loc1=[]
        loc2=[]
        loc3=[]
        loc4=[]
        loc5=[]
        loc6=[]
        loc7=[]
        loc8=[]

        for trial in cue1locTrials[0]:
            loc1.append(trialMeans[trial][neuron])
        for trial in cue1locTrials[1]:
            loc2.append(trialMeans[trial][neuron])
        for trial in cue1locTrials[2]:
            loc3.append(trialMeans[trial][neuron])
        for trial in cue1locTrials[3]:
            loc4.append(trialMeans[trial][neuron])
        for trial in cue1locTrials[4]:
            loc5.append(trialMeans[trial][neuron])
        for trial in cue1locTrials[5]:
            loc6.append(trialMeans[trial][neuron])
        for trial in cue1locTrials[6]:
            loc7.append(trialMeans[trial][neuron])
        for trial in cue1locTrials[7]:
            loc8.append(trialMeans[trial][neuron])

        ans1 = f_oneway(loc1,loc2,loc3,loc4,loc5,loc6,loc7,loc8)

        loc1=[]
        loc2=[]
        loc3=[]
        loc4=[]
        loc5=[]
        loc6=[]
        loc7=[]
        loc8=[]

        for trial in cue2locTrials[0]:
            loc1.append(trialMeans[trial][neuron])
        for trial in cue2locTrials[1]:
            loc2.append(trialMeans[trial][neuron])
        for trial in cue2locTrials[2]:
            loc3.append(trialMeans[trial][neuron])
        for trial in cue2locTrials[3]:
            loc4.append(trialMeans[trial][neuron])
        for trial in cue2locTrials[4]:
            loc5.append(trialMeans[trial][neuron])
        for trial in cue2locTrials[5]:
            loc6.append(trialMeans[trial][neuron])
        for trial in cue2locTrials[6]:
            loc7.append(trialMeans[trial][neuron])
        for trial in cue2locTrials[7]:
            loc8.append(trialMeans[trial][neuron])

        ans2 = f_oneway(loc1,loc2,loc3,loc4,loc5,loc6,loc7,loc8)

        choice1 = []
        choice2 = []

        for trial in choices[0]:
            choice1.append(trialMeans[trial][neuron])

        for trial in choices[1]:
            choice2.append(trialMeans[trial][neuron])

        ans3 = f_oneway(choice1, choice2)

        # includes pvalue cutoffs
        # if ans1.pvalue < pval and ans2.pvalue < pval and ans3.pvalue < pval:
        #     cue1Fs.append(ans1.statistic)
        #     cue2Fs.append(ans2.statistic)
        #     cueDiffFs.append(ans3.statistic)

        # without pvalue cutoffs
        cue1Fs.append(ans1.statistic)
        cue2Fs.append(ans2.statistic)
        cueDiffFs.append(ans3.statistic)

        # assorted point markets by pval
        if ans1.pvalue < 0.001 and ans2.pvalue < 0.001 and ans3.pvalue < 0.001:
            pvalClass.append(1)
            sigNeurons.append(neuron)
        elif ans1.pvalue < 0.01 and ans2.pvalue < 0.01 and ans3.pvalue < 0.01:
            pvalClass.append(2)
            sigNeurons.append(neuron)
        elif ans1.pvalue < 0.05 and ans2.pvalue < 0.05 and ans3.pvalue < 0.05:
            pvalClass.append(3)
        else:
            pvalClass.append(4)

    ################### First, z-score the fstats ##################
    cue1Fs.remove(max(cue1Fs))
    cue1Fs.remove(min(cue1Fs))

    cue2Fs.remove(max(cue2Fs))
    cue2Fs.remove(min(cue2Fs))

    cueDiffFs.remove(max(cueDiffFs))
    cueDiffFs.remove(min(cueDiffFs))
    
    cue1Fs = util.zscore(cue1Fs)
    

    cue2Fs = util.zscore(cue2Fs)

    cueDiffFs = util.zscore(cueDiffFs)

    ######### Now, do a 3d scatterplot for the 3 groups ############

    print sigNeurons
    markerTypes = {1: {'m': '^', 'c': 'k'}, 2: {'m': '^', 'c': 'b'},
                   3: {'m': '^', 'c': 'y'}, 4: {'m': '^', 'c': 'r'}}

    fig3d = plt.figure()
    ax = fig3d.add_subplot(111, projection='3d')
    
    for neuron in range(len(cue1Fs)):
        xp = cue1Fs[neuron]
        yp = cue2Fs[neuron]
        zp = cueDiffFs[neuron]
        ax.scatter(xp, yp, zp, 
                   marker=markerTypes[pvalClass[neuron]]['m'],
                   c=markerTypes[pvalClass[neuron]]['c'],
                   s=40)

    ax.set_xlabel('Cue 1 F-Stat')
    ax.set_ylabel('Cue 2 F-Stat')
    ax.set_zlabel('Cue Pref F-Stat')

    ax.set_xlim(1.2*min(cue1Fs), 1.2*max(cue1Fs))
    ax.set_ylim(1.2*min(cue2Fs), 1.2*max(cue2Fs))
    ax.set_zlim(1.2*min(cueDiffFs), 1.2*max(cueDiffFs))
    plt.show(block=True)
    # plt.pause(100)

    # return

        # if ans.pvalue < pval:
        #     numSigLoc[loc] += 1
        #     sigNeurons.append(neuron)

    ##########################################################
    # Firing Rate Bar Graphs
    ##########################################################

    pylab.ion()
    fig = pylab.figure()
    pause = False
    fig.canvas.mpl_connect('button_press_event', onclick)

    #### a little quick and dirty graph if you want it

    # look at a random neuron
    # neuron = sigNeurons[random.randint(0, len(sigNeurons) - 1)]
    # average firing rates of neuron for each location
    locActs = np.zeros(numLocations)

    for loc in range(numLocations):
        sample = []
        for trial in locTrials[loc]:
            sample.append(trialMeans[trial][neuron])
        locActs[loc] = np.mean(sample)

    width = 0.35
    xvals = np.arange(numLocations)
    plt.bar(xvals, locActs, color="k")
    plt.ylabel("Mean Firing Rate")
    plt.title('Neuron: {}'.format(neuron))
    plt.xticks(xvals + width)
    # plt.show()
    # plt.pause(100)

    # neuron = 75
    index = 0
    neuron = sigNeurons[index]
    while True:
        if not pause:
            # if neuron >= len(trialMeans[0]):
            #     break
            if index >= len(sigNeurons):
                break

            plt.clf() # clear the plot

            # average firing rates of neuron for each location
            locActs = np.zeros(numLocations)

            for loc in range(numLocations):
                sample = []
                for trial in locTrials[loc]:
                    sample.append(trialMeans[trial][neuron])
                locActs[loc] = np.mean(sample)

            width = 0.35
            # fig, ax = plt.subplots()
            xvals = np.arange(numLocations)
            # bar1 = ax.bar(xvals, locActs, color="k")
            plt.bar(xvals, locActs, color="k")
            # add some text for labels, title and axes ticks
            # ax.set_ylabel("Mean Firing Rate")
            # ax.set_title('Neuron: {}'.format(neuron))
            # ax.set_xticks(xvals + width)
            # ax.set_xticklabels((str(x) for x in range(numLocations)))
            plt.ylabel("Mean Firing Rate")
            plt.title('Neuron: {}'.format(neuron))
            plt.xticks(xvals + width)
            # plt.xticklabels((str(x) for x in range(numLocations)))

            plt.draw()
            plt.pause(2)

            # neuron += 1
            index += 1
            neuron = sigNeurons[index]

        fig.canvas.get_tk_widget().update() # process events


def main():
    # attention task
    anova("attention_11x11_8_targets_shuffle", "W_Full", "TESTattention_11x11_8_targets_shuffle.txt")

if __name__ == "__main__":
    main()

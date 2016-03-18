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
import experiment as e

####################################################################################

random.seed()
pause = False

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
def anova(expPath, imageFile=None):
    exp = e.experiment()
    exp.read(expPath, W=True)

    if imageFile is None:
        imageFile = "anova.png"
        
    ret = exp.getTrainInputs()
    # ret = exp.getTestInputs()

    ##########################################################
    # must find way to generalize this value
    numLocations = exp.exp['num_locs']
    pval = 0.01
    ##########################################################

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    np.set_printoptions(edgeitems = 10)

    #create an output file for the activations. I don't actually use this yet.
    # out2 = open("activations", "wb+")

    locTrials = [list([]) for _ in range(numLocations)]
    cue1locTrials = [list([]) for _ in range(numLocations)]
    cue2locTrials = [list([]) for _ in range(numLocations)]
    choices = [list([]) for _ in range(2)]

    conjPairs = []
    conjTrials = []

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

        # print loc1
        # print len(locTrials)
        locTrials[loc1].append(trial)
        locTrials[loc2].append(trial)
        choices[choice].append(trial)
        cue1locTrials[loc1].append(trial)
        cue2locTrials[loc2].append(trial)

        i = min(loc1, loc2)
        j = max(loc1, loc2)
        pair = [i, j]
        if pair not in conjPairs:
            conjPairs.append(pair)
            conjTrials.append([])
        conjTrials[conjPairs.index(pair)].append(trial)

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
    print "# sig neurons that prefer choice selection (1st or 2nd cue,): {}, pval < {}".format(count, pval)
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

    #####################################################################
    # Here are the different anova functions I made. Call the tests you
    # want to see.
    #####################################################################

    conjugateTest(numLocations, trialMeans, locTrials, conjTrials)
    # cueDiffTest(numLocations, trialMeans, cue1locTrials, cue2locTrials, choices)
    # firingRateGraphs(numLocations, trialMeans, locTrials, sigNeurons, choices)

def conjugateTest(numLocations, trialMeans, locTrials, conjTrials):
    ##########################################################
    # 2d F-stat plots
    ##########################################################

    # trialMeans = trialMeansDelayOnly

    # featFs = [list([]) for _ in range(len(trialMeans[0]))]
    # conjFs = [list([]) for _ in range(len(trialMeans[0]))]
    featFs = []
    conjFs = []

    # This tracks the "pvalue class" of each point. Basically, how significant
    # were the f-statistics to change the markers to match significance
    pvalClass = []

    # Particularly signficant neurons that may be good to look at
    sigNeurons = []

    ####################################################################
    # Compile 2 groups:
    # featFs : F-stat of 1xNumlocs anova for each neuron's mean firing rate for each
        # trial in which location 'x' appears at all
    # conjFs : F-stat of 1x (NumlocsxNumlocs) anova for each neuron's mean firing 
        # rate for each trial in which conjunction 'loc1' & 'loc2' appears
    ####################################################################
    for neuron in range(len(trialMeans[0])):
        locs = []
        
        for loc in range(numLocations):
            means = []
            for trial in locTrials[loc]:
                means.append(trialMeans[trial][neuron])
            locs.append(means)

        ans1 = f_oneway(*locs)

        conj = []
        
        for trials in conjTrials:
            means = []
            for trial in trials:
                means.append(trialMeans[trial][neuron])
            conj.append(means)

        ans2 = f_oneway(*conj)

        # includes pvalue cutoffs
        # if ans1.pvalue < pval and ans2.pvalue < pval and ans3.pvalue < pval:
        #     cue1Fs.append(ans1.statistic)
        #     cue2Fs.append(ans2.statistic)
        #     cueDiffFs.append(ans3.statistic)

        # without pvalue cutoffs
        featFs.append(ans1.statistic)
        conjFs.append(ans2.statistic)

        # assorted point markets by pval
        if ans1.pvalue < 0.001 and ans2.pvalue < 0.001:
            pvalClass.append(1)
            sigNeurons.append(neuron)
        elif ans1.pvalue < 0.01 and ans2.pvalue < 0.01:
            pvalClass.append(2)
            sigNeurons.append(neuron)
        elif ans1.pvalue < 0.05 and ans2.pvalue < 0.05:
            pvalClass.append(3)
        else:
            pvalClass.append(4)

    ################### z-score the fstats ##################
    featFs.remove(max(featFs))
    featFs.remove(min(featFs))
    # cue1Fs.remove(max(cue1Fs))
    # cue1Fs.remove(min(cue1Fs))

    conjFs.remove(max(conjFs))
    conjFs.remove(min(conjFs))
    # cue2Fs.remove(max(cue2Fs))
    # cue2Fs.remove(min(cue2Fs))
    
    featFs = util.zscore(featFs)
    conjFs = util.zscore(conjFs)

   ######### Now, do a 2d scatterplot for the 2 groups ############

    # markerTypes = {1: {'m': '^', 'c': 'k'}, 2: {'m': '^', 'c': 'b'},
    #                3: {'m': '^', 'c': 'y'}, 4: {'m': '^', 'c': 'r'}}
    markerTypes = {1: {'m': '^', 'c': 'k'}, 2: {'m': '^', 'c': 'k'},
                   3: {'m': '^', 'c': 'r'}, 4: {'m': '^', 'c': 'r'}}

    fig2d = plt.figure()
    ax = fig2d.add_subplot(111)
    
    for neuron in range(len(featFs)):
        xp = featFs[neuron]
        yp = conjFs[neuron]
        ax.scatter(xp, yp, 
                   marker=markerTypes[pvalClass[neuron]]['m'],
                   c=markerTypes[pvalClass[neuron]]['c'],
                   s=40)

    ax.set_xlabel('Feature Selectivity')
    ax.set_ylabel('Conjunctive Selectivity')

    ax.set_xlim(1.2*min(featFs), 1.2*max(featFs))
    ax.set_ylim(1.2*min(conjFs), 1.2*max(conjFs))
    plt.show(block=True)

def cueDiffTest(numLocations, trialMeans, cue1locTrials, cue2locTrials, choices):
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

    ####################################################################
    # Compile 3 groups:
    # cue1Fs : F-stat of 1xNumlocs anova for each neuron's mean firing rate for each
        # trial in which location 'x' appears at cue 1
    # cue2Fs : F-stat of 1xNumlocs anova for each neuron's mean firing rate for each
        # trial in which location 'x' appears at cue 2
    # cueDiffFs : F-stat of 1x2 anova for each neurons' mean firing rate for 2
        # groups, split between cue 1 and cue 2
    ####################################################################
    for neuron in range(len(trialMeans[0])):
        locs = []
        
        for loc in range(numLocations):
            locN = []
            for trial in cue1locTrials[loc]:
                locN.append(trialMeans[trial][neuron])
            locs.append(locN)

        ans1 = f_oneway(*locs)

        locs = []
        
        for loc in range(numLocations):
            locN = []
            for trial in cue2locTrials[loc]:
                locN.append(trialMeans[trial][neuron])
            locs.append(locN)

        ans2 = f_oneway(*locs)

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

    ################### z-score the fstats ##################
    cue1Fs.remove(max(cue1Fs))
    cue1Fs.remove(min(cue1Fs))
    # cue1Fs.remove(max(cue1Fs))
    # cue1Fs.remove(min(cue1Fs))

    cue2Fs.remove(max(cue2Fs))
    cue2Fs.remove(min(cue2Fs))
    # cue2Fs.remove(max(cue2Fs))
    # cue2Fs.remove(min(cue2Fs))

    cueDiffFs.remove(max(cueDiffFs))
    cueDiffFs.remove(min(cueDiffFs))
    # cueDiffFs.remove(max(cueDiffFs))
    # cueDiffFs.remove(min(cueDiffFs))
    
    cue1Fs = util.zscore(cue1Fs)
    
    cue2Fs = util.zscore(cue2Fs)

    cueDiffFs = util.zscore(cueDiffFs)

    ######### Now, do a 3d scatterplot for the 3 groups ############

    # markerTypes = {1: {'m': '^', 'c': 'k'}, 2: {'m': '^', 'c': 'b'},
    #                3: {'m': '^', 'c': 'y'}, 4: {'m': '^', 'c': 'r'}}
    markerTypes = {1: {'m': '^', 'c': 'k'}, 2: {'m': '^', 'c': 'k'},
                   3: {'m': '^', 'c': 'r'}, 4: {'m': '^', 'c': 'r'}}

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

def firingRateGraphs(numLocations, trialMeans, locTrials, sigNeurons, choices):
    ##########################################################
    # Firing Rate Bar Graphs
    ##########################################################
    pylab.ion()
    fig = pylab.figure()
    fig.canvas.mpl_connect('button_press_event', onclick)

    #### a little quick and dirty graph if you want it

    # average firing rates of neuron for each location
    locActs = np.zeros(numLocations)

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

            choiceActs = np.zeros(2)

            for choice in range(2):
                sample = []
                for trial in choices[choice]:
                    sample.append(trialMeans[trial][neuron])
                choiceActs[choice] = np.mean(sample)


            # First for location selectivity

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
            plt.pause(1.5)

        if not pause:

            plt.clf() # clear the plot

            # Now for the choice selectivity

            width = 0.35
            # fig, ax = plt.subplots()
            yvals = np.arange(2)
            # bar1 = ax.bar(xvals, locActs, color="k")
            plt.bar(yvals, choiceActs, color="k")
            # add some text for labels, title and axes ticks
            # ax.set_ylabel("Mean Firing Rate")
            # ax.set_title('Neuron: {}'.format(neuron))
            # ax.set_xticks(xvals + width)
            # ax.set_xticklabels((str(x) for x in range(numLocations)))
            plt.ylabel("Mean Firing Rate")
            plt.title('Neuron: {}'.format(neuron))
            plt.xticks(yvals + width)
            # plt.xticklabels((str(x) for x in range(numLocations)))
            plt.draw()
            plt.pause(1.5)

            # neuron += 1
            index += 1
            neuron = sigNeurons[index]

        fig.canvas.get_tk_widget().update() # process events

def main():
    anova("experiments/selection106/selection106.exp")
    # anova("experiments/combined108/combined108.exp")

    # did NOT generalize the task
    # anova("experiments/attention58/attention58.exp")

if __name__ == "__main__":
    main()

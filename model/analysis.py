import ast
import random
import math
import os
import sys
import matplotlib
import pickle
import gzip
import copy

import numpy as np
import utility as util
import experiment as e
import inputGenV2 as ipgv2

# from util import q

# import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d, Axes3D
from scipy.cluster.hierarchy import dendrogram, linkage
from scipy.optimize import minimize
from numpy.linalg import inv

from pprint import pprint
from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN

from sklearn import linear_model as lm
from sklearn.decomposition import PCA
from sklearn.manifold import TSNE

def analysis(exp, save=True):
    '''I envisioned this as sort of do-it-all analysis that would
    combine all of the analysis functions, but that plan fell by
    the wayside a bit. Leaving it open for later potential use.'''
    raise Exception("Function not yet implemented.")

def getPCA(exp, numComponents=3, test=False, trials=None,
           steps=None):

    if exp.exp['version'] != 2:
        raise Exception("This only works on version 2 exps for now.")

    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    trial_acts = []
    infos = []
    stateActs = None

    selectTrials = []

    pca = PCA(n_components=numComponents)

    if trials is None:
        trials = range(len(inputs))
    if steps is None:
        steps = range(len(inputs[0]))

    for trial in trials:
        j = np.asarray(inputs[trial])

        info = ast.literal_eval(inames[trial])
        infos.append(info)

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:, 0, :]

        hidden = list_subset(hidden, steps)

        if stateActs is None:
            stateActs = hidden
        else:
            stateActs = np.concatenate((stateActs, hidden))

        # trial_acts.append(hidden)

    # trial_acts = np.asarray(trial_acts)
    # print trial_acts[0].shape

    pca.fit(stateActs)

    return pca

def list_subset(lst, elements):
    new_list = []
    for i in elements:
        new_list.append(lst[i])
    return new_list

def pcaProjection(exp, numComponents=3, trials=None,
                  test=False, task=None, select=False,
                  delay_only=False,
                  selection_delay_only=False):

    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    trial_acts = []
    infos = []
    stateActs = None

    selectTrials = []

    pca = PCA(n_components=numComponents)

    if trials is None:
        trials = [1, 10, 11, 12]

    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])

        info = ast.literal_eval(inames[trial])
        infos.append(info)

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:, 0, :]

        if task == None:
            if stateActs is None:
                stateActs = hidden
            else:
                stateActs = np.concatenate((stateActs, hidden))
        elif task == "attention":
            if info['task'] == "attention":
                if info['inputs']['cue1'] == 1:
                    if info['inputs']['choice'] == 1:
                        selectTrials.append(trial)
                if stateActs is None:
                    if delay_only:
                        stateActs = hidden[15:20]
                    else:
                        stateActs = hidden
                else:
                    if delay_only:
                        stateActs = np.concatenate((stateActs, hidden[15:20]))
                    else:
                        stateActs = np.concatenate((stateActs, hidden))
        elif task == "selection":
            if info['task'] == "selection":
                if info['inputs']['cue1'] == 1:
                    if info['inputs']['choice'] == 1:
                        selectTrials.append(trial)
                if stateActs is None:
                    if delay_only:
                        stateActs = hidden[15:20]
                    elif selection_delay_only:
                        stateActs = hidden[9:12]
                    else:
                        stateActs = hidden
                else:
                    if delay_only:
                        stateActs = np.concatenate((stateActs, hidden[15:20]))
                    elif selection_delay_only:
                        stateActs = np.concatenate((stateActs, hidden[9:12]))
                    else:
                        stateActs = np.concatenate((stateActs, hidden))

        trial_acts.append(hidden)

    # trial_acts = np.asarray(trial_acts)
    # print trial_acts[0].shape

    pca.fit(stateActs)
    print pca.explained_variance_ratio_

    # plt.plot(pca.explained_variance_ratio_)
    # plt.show(block=True)

    # exit()

    all_reduced = []
    count = 1

    I = 6

    cs=['b','g','r','k']

    ls=['-','--','-.',':']

    if select == True:
    # First, the row of only att trials
        for i in range(I):

            ci=0
            c=cs[ci]

            li=0
            l=ls[li]

            x = selectTrials[random.randint(0, len(selectTrials)-1)]
            plt.subplot(2, 3, count) # hard coded??? SHAME!

            # fig = plt.figure()
            # ax = fig.add_subplot(111)

            # # ax = fig3d.add_subplot(111, projection='3d')
            # ax = Axes3D(fig3d)

            count += 1
            # stuff = np.zeros((len(inputs[0]), numComponents))

            acts_reduced = np.asarray(pca.transform(trial_acts[x]))

            for j in range(len(acts_reduced[0])):
                plt.plot(acts_reduced[:, j], c=c, ls=l)
                ci+=1
                c=cs[ci % len(cs)]
                li+=1
                l=ls[li % len(ls)]

            if exp.exp['version'] == 2:
                plt.axvline(2, linestyle='dashed')
                plt.axvline(5, linestyle='dashed')
                plt.axvline(8, linestyle='dashed')
                plt.axvline(11, linestyle='dashed')
                plt.axvline(14, linestyle='dashed')
                plt.axvline(19, linestyle='dashed')
                plt.axvline(22, linestyle='dashed')

            # x = acts_reduced[:,0]
            # y = acts_reduced[:,1]
            # z = acts_reduced[:,2]

            # for comp in range(numComponents):
            #     stuff[:, comp] = acts_reduced[:, comp]
            # stuff = np.asarray(stuff)

            # plt.plot(stuff)
            # ax.plot(x,y)
            # ax.plot(x,y,z)

            plt.title(infos[x]['task'] + ", Trl: " + str(x) + ", " +
                        ", Chc: " + str(infos[x]['inputs']['choice']) +
                        ", Locs: " + 
                        str(infos[x]['inputs']['cue1']) + "/" + 
                        str(infos[x]['inputs']['cue2']))

            # plt.show(block=True)
            # plt.clf()
        plt.show(block=True)
        plt.clf()
    
    count = 1

    for i in range(I):

        ci=0
        c=cs[ci]

        li=0
        l=ls[li]

        x = trials[random.randint(0, len(trials)-1)]
        plt.subplot(2, 3, count) # hard coded??? SHAME!

        count += 1
        # stuff = np.zeros((len(inputs[0]), numComponents))

        acts_reduced = np.asarray(pca.transform(trial_acts[x]))

        for j in range(len(acts_reduced[0])):
            plt.plot(acts_reduced[:, j], c=c, ls=l)
            ci+=1
            c=cs[ci % len(cs)]
            li+=1
            l=ls[li % len(ls)]
        if exp.exp['version'] == 2:
            plt.axvline(2, linestyle='dashed', c='k')
            plt.axvline(5, linestyle='dashed', c='k')
            plt.axvline(8, linestyle='dashed', c='k')
            plt.axvline(11, linestyle='dashed', c='k')
            plt.axvline(14, linestyle='dashed', c='k')
            plt.axvline(19, linestyle='dashed', c='k')
            plt.axvline(22, linestyle='dashed', c='k')

        plt.title(infos[x]['task'] + ", Trl: " + str(x) + ", " +
                    ", Chc: " + str(infos[x]['inputs']['choice']) +
                    ", Locs: " + 
                    str(infos[x]['inputs']['cue1']) + "/" + 
                    str(infos[x]['inputs']['cue2']))
        
    plt.show(block=True)

def plotPCproj(exp, test=False, d3=False):
    rnn = exp.rnn

    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    info0 = ast.literal_eval(inames[0])
    cue1 = info0['inputs']['cue1']
    cue2 = info0['inputs']['cue2']

    if exp.exp['type'] == "selection":
        pc1 = getPCA(exp, steps=[1,2])
        pc2 = getPCA(exp, steps=[7,8])
        pc3 = getPCA(exp, steps=[13,14])
        # pc3 = getPCA(exp, steps=[21, 22])
    elif exp.exp['type'] == "attention":
        pc1 = getPCA(exp, steps=[7,8])
        pc2 = getPCA(exp, steps=[13,14])
        pc3 = getPCA(exp, steps=[1,2])
        # pc3 = getPCA(exp, steps=[21,22])
    else:
        raise Exception("Can only do this for attention/selection task right now.")


    # pc1 = getPCA(exp, steps=[20, 21, 22])
    # pc2 = getPCA(exp, steps=[6,7,8])

    # pc1 = getPCA(exp, steps=[19, 20], trials=trials1)
    # pc2 = getPCA(exp, steps=[19, 20], trials=trials2)

    # print pc1.explained_variance_ratio_
    # print pc2.explained_variance_ratio_
    # exit()

    # 1, 20, 23, 149, for selection92
    # 20 is super nice for selection 92

    # for step 1 and 2
    ci = 0
    cs = ['r', 'g', 'b', 'crimson', 'k', 'k', 'k']
    c = cs[ci]

    # trials = range(5)
    # trials = [100,24,25]
    trials = [0,1,2,3,4,5,6]
    # trials = [20]

    fig = plt.figure()
    if d3:
        ax = fig.add_subplot(111, projection='3d')
        ax = Axes3D(fig)
    else:
        ax = fig.add_subplot(111)

    for t in trials: 

        info = ast.literal_eval(inames[t])

        j = np.asarray(inputs[t])
        j_copy = copy.copy(j)

        # Switch the selection parameter

        j_copy[12][-2] = j[12][-1]
        j_copy[13][-2] = j[13][-1]
        j_copy[14][-2] = j[14][-1]
        j_copy[12][-1] = j[12][-2]
        j_copy[13][-1] = j[13][-2]
        j_copy[14][-1] = j[14][-2]
        # j_copy[12][-2:] = [1, 0]
        # j_copy[13][-2:] = [1, 0]
        # j_copy[14][-2:] = [1, 0]


        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:,0,:]

        hiddenswitch = rnn.forward(j_copy, rnn.W)[1]
        hiddenswitch = hiddenswitch[:,0,:]

        # steps = [9,10,11]
        # part = "Sample 2"

        # steps = [17, 18, 19]
        # part = "Delay"

        # steps = [12,13,14]
        # part = "Selection"

        # steps = range(23)
        # part = "All"

        steps = range(20)
        part = "All but Output"

        # steps = [20,21,22]
        # part = "Output"

        # steps = [0,1,2]
        # part = "Sample 1"

        # steps = [2, 18]
        # part = "Sample 1 and Delay"

        hids = [hidden, hiddenswitch]
        js = [j, j_copy]

        for a in range(2):

            coors = []

            for step in steps:

                hid = hids[a][step]
                in_ = js[a][step]

                # hid=hidden[step]
                # in_ = j[step]

                # in_[0:numLocs] = [0 for i in range(numLocs)]
                # in_[-2:] = [0 for i in range(2)]

                hidp1 = pc1.transform(hid.reshape(1,-1))[0,0]
                hidp2 = pc2.transform(hid.reshape(1,-1))[0,0]
                hidp3 = pc3.transform(hid.reshape(1,-1))[0,0]


                if d3:
                    coori = [hidp1, hidp2, hidp3]
                else:
                    coori = [hidp1, hidp2]

                coors.append(coori)

            coors = np.asarray(coors)
            if d3:
                ax.scatter(coors[0][0], coors[0][1], coors[0][2], color=c, marker='s', s=30)
                ax.plot(coors[:, 0], coors[:, 1], coors[:, 2], color=c, ls="--")
                ax.scatter(coors[-1][0], coors[-1][1], coors[-1][2], color=c, marker='*',s=30)
            else:
                ax.scatter(coors[0,0], coor1[0,1], color=c, marker='s', s=30)
                ax.plot(coors[:, 0], coors[:, 1], color=c, ls="--")
                ax.scatter(coors[-1][0], coors[-1][1], color=c, marker='*',s=30)

            ci += 1
            c = cs[ci % len(cs)]

        tit = '''RNN Relaxation along Task PC's:
    {} Task, {}, Trial #{}'''.format(exp.exp['type'].capitalize(), part, t)
        plt.title(tit)
        ax.set_xlabel('PC Sample 1')
        ax.set_ylabel('PC Sample 2')
        if d3:
            ax.set_zlabel('PC Selection Cue')
        plt.axis([-1.2, 1.2, -1.2, 1.2])

        plt.show(block=True)
        plt.clf()
        plt.close()
        # plt.cla()
        # fig.clf()

        fig = plt.figure()
        if d3:
            ax = fig.add_subplot(111, projection='3d')
            ax = Axes3D(fig)
        else:
            ax = fig.add_subplot(111)

    exit()

def FRplot(exp, trials=None, neurons=None, test=False):
    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    if trials != None:
        i = 1
        for trial in trials:
            j = np.asarray(inputs[trial])

            info = ast.literal_eval(inames[trial])

            # compute activations and select the hidden layer
            hidden = rnn.forward(j, rnn.W)[1]

            # eliminate this extra dimension from the outputs.
            # still not exactly sure what this dimension is
            hidden = hidden[:, 0, :]

            for neuron in neurons:
                trialActs = hidden[:, neuron]

                plt.subplot(len(trials), len(neurons), i)
                plt.title('Trial: {}, Neu: {}, Sel: {}, Locs: {}/{}'.format(trial, neuron, 
                                                                            info['inputs']['choice'],
                                                                            info['inputs']['cue1'],
                                                                            info['inputs']['cue2']),
                          fontsize=8)
                i += 1

                frame1 = plt.gca()
                frame1.axes.get_xaxis().set_visible(False)
                frame1.axes.get_yaxis().set_visible(False)

                plt.plot(trialActs)

        plt.show(block=True)

    else:
        for trial in range(len(inputs)):
            j = np.asarray(inputs[trial])

            # compute activations and select the hidden layer
            hidden = rnn.forward(j, rnn.W)[1]

            # eliminate this extra dimension from the outputs.
            # still not exactly sure what this dimension is
            hidden = hidden[:, 0, :]

            for unit in range(len(hidden[0])):
                trialActs = hidden[:, unit]
                # do some plotting

            raise Exception ("Stopped implementing here....")

def trig(loc, num_locs):
    theta = float(loc)/float(num_locs) * 2 * math.pi
    return (math.sin(theta), math.cos(theta))

# Parmas
# exp - obviously an experiment
# test - a boolean, whether or not to use testing set
#   False by default
def linearModel(exp, test=False):    
    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    combined = False
    if exp.exp['type'] == "combined":
        combined = True

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    trialMeans = []
    layers = []

    # The trial mean firing rates for the delay period alone
    trialMeansDelayOnly = []

    predictors = []

    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])

        info = ast.literal_eval(inames[trial])

        # the trial row for the regression
        ##################################################
        # structure of trow variables is as follows:
        # No no, chagned this xxxxxx
        #   n locs, (n choose 2) conj locs,
        #   2 * n locs (conj of loc and cue),
        #   2 * n locs (conj of loc and choice),
        #   1 variable for the 2 choices
        # xxxxxxxxx
        # New variables:
        #   B1 = sine answer loc
        #   B2 = cosine answer loc
        #   B3 = sine loc 1
        #   B4 = cosine loc 1
        #   B5 = sine loc 2
        #   B6 = cosine loc 2
        #   B7 = choice selection
        #   B8 = task selection
        ##################################################
        trow = []

        # # SET 1, not used anymore
        # # these feature variables only track whether a loc exists or not
        # for loc in range(numLocs):
        #     if info['inputs']['cue1'] == loc:
        #         trow.append(1)
        #     elif info['inputs']['cue2'] == loc:
        #         trow.append(1)
        #     else:
        #         trow.append(0)

        # # the conjugate variables track whether two locs appear together
        # for loc1 in range(numLocs):
        #     for loc2 in range(loc1 + 1, numLocs):
        #         if loc1 == loc2:
        #             raise Exception("that shouldn't happen...")
        #         if info['inputs']['cue1'] == loc or info['inputs']['cue2'] == loc:
        #             if info['inputs']['cue1'] == loc2 or info['inputs']['cue2'] == loc2:
        #                 trow.append(1)
        #             else:
        #                 trow.append(0)
        #         else:
        #             trow.append(0)

        # # the loc-cue conjugate variables track whether a loc and cue occur together
        # for loc in range(numLocs):
        #     if info['inputs']['cue1'] == loc:
        #         trow.append(1)
        #     else:
        #         trow.append(0)

        # for loc in range(numLocs):
        #     if info['inputs']['cue2'] == loc:
        #         trow.append(1)
        #     else:
        #         trow.append(0)

        # # the loc-choice conjugate variables track whether a loc and choice occur together
        # for loc in range(numLocs):
        #     if info['inputs']['cue1'] == loc and info['inputs']['choice'] == 1:
        #         trow.append(1)
        #     elif info['inputs']['cue2'] == loc and info['inputs']['choice'] == 2:
        #         trow.append(1)
        #     else:
        #         trow.append(0)

        # # the choice variable tracks whether choice 1 or 2 appears
        # if info['inputs']['choice'] == 1:
        #     trow.append(0)
        # else:
        #     trow.append(1)

        # # and the cue variable tracks whether choice 1 or 2 appears
        # if info['inputs']['cue1'] == 1:
        #     trow.append(1)
        # else:
        #     trow.append(0)

        if info['inputs']['choice'] == 1:
            ans = info['inputs']['cue1']
        else:
            ans = info['inputs']['cue2']

        sina, cosa = trig(ans, numLocs)
        trow.append(sina)
        trow.append(cosa)

        sin1, cos1 = trig(info['inputs']['cue1'], numLocs)
        trow.append(sin1)
        trow.append(cos1)

        sin2, cos2 = trig(info['inputs']['cue2'], numLocs)
        trow.append(sin2)
        trow.append(cos2)

        if info['inputs']['choice'] == 1:
            trow.append(-1)
        else:
            trow.append(1)

        if combined:
            if info['task'] == "attention":
                trow.append(-1)
            else:
                trow.append(1)

        # trow.append(sin1*cos1*sin2*cos2)

        # trow.append(sin1*sin2)

        # trow.append(cos1*cos2)

        # trow.append(sin1*cos1)
        
        # trow.append(sin2*cos2)

        predictors.append(trow)

        # compute activations and select the hidden layer
        hidden = rnn.forward(j, rnn.W)[1]

        # eliminate this extra dimension from the outputs.
        # still not exactly sure what this dimension is
        hidden = hidden[:, 0, :]

        # means = [];
        # # This "meansDelayOnly" is the mean firing rate for the delay period only
        # meansDelayOnly = []

        # for unit in range(len(hidden[0])):
        #     means.append(np.mean(hidden[:, unit]))
            # # meansDelayOnly.append(np.mean(hidden[-10:-5, unit]))

        # trialMeans.append(means)
        layers.append(hidden)
        # trialMeansDelayOnly.append(meansDelayOnly)

    # trialMeans = np.asarray(trialMeans)
    layers = np.asarray(layers)

    zlayers = []

    for unit in range(len(layers[0, 0])):
        zlayers.append(util.zscore(layers[:,:,unit]))
        # trial = []
        # for step in range(len(layers[0,:,0])):
        #     zs = util.zscore(layers[:,step,unit])
        #     trial.append(zs)
        # zlayers.append(trial)

    zlayers = np.asarray(zlayers)

    # zlayers = np.swapaxes(zlayers, 0,2)

    zlayers = np.swapaxes(zlayers, 0,1)
    zlayers = np.swapaxes(zlayers, 1,2)

    predictors = np.asarray(predictors)

    coefs = []

    count = 0
    alpha = .1

    for neuron in range(len(zlayers[0,0])):
    # for t in [1,6,11,17,22]:
        
        ########################################################################
        # ALTERNATE way of doing Linear Regression from Sussillo et al
        ########################################################################

        # just use step t for now
        t = 6
        # rit = zlayers[:,t,neuron]
        # F = np.swapaxes(predictors, 0, 1)

        ###### Equ: Bs = inv(F*F.transpose())*F*rit #######
        # arg1 = F.dot(F.transpose())
        # arg2 = inv(arg1)
        # Bs = arg2.dot(F).dot(rit)
        
        # print Bs
        # print Bs[0:2]
        # print Bs[2:4]
        # print Bs[4:6]
        # print Bs[6]
        # print Bs[7:-1]
        # print Bs[-1]

        # exit()

        ########################################################################
        ########################################################################

        mFRs = zlayers[:, :, neuron]

        # # OLS model
        # olm = lm.LinearRegression()
        # olm.fit(predictors, mFRs)

        # print olm.get_params()
        # print
        # print olm.coef_

        # # Elastic Net regression
        # enet = lm.ElasticNet(alpha=alpha, l1_ratio=0.7)
        # enet.fit(predictors, mFRs)

        # print enet.get_params()
        # print
        # print enet.coef_
        # print
        # exit()

        # # lasso regression
        # lasso = lm.Lasso(alpha=alpha)
        # lasso.fit(predictors, mFRs)

        # print lasso.get_params()
        # print
        # print lasso.coef_
        # print
        # exit()

        # # LassoCV regression
        # lassocv = lm.LassoCV()

        lassocv = lm.MultiTaskLassoCV()
        lassocv.fit(predictors, mFRs)

        coefs.append(lassocv.coef_)

        # print lassocv.get_params()
        # print
        # c = np.asarray(lassocv.coef_)
        # # for x in range(len(c)):
        # #     print c[x]
        # print c[1]
        # print c[6]
        # print c[11]
        # exit()
        # if count > 5:
        #     exit()
        # count += 1

        # # ridge regression
        # rrg = lm.Ridge(alpha=alpha)
        # rrg.fit(predictors, mFRs)

        # print rrg.get_params()
        # print
        # print rrg.coef_
        # print
        # exit()

        # predPCA = PCA(n_components = 20)
        # predPCA.fit(predictors)

        # print predPCA.explained_variance_ratio_
        # exit()

        # alphas = [0.5 for _ in range(len(trialMeans))]
        # print vif_ridge(predictors, alphas, is_corr=False)[0]
        # exit()

    coefs = np.asarray(coefs)

    coefs = np.swapaxes(coefs, 0, 2)

    fcoefs = gzip.open(exp.exp['directory'] + "coefs.gzip.pkl", "wb")
    pickle.dump(coefs, fcoefs)
    fcoefs.close()

    return coefs


# calcuates the angle of saccade based on the 4 unit output model
def calcTheta(output):
    c = 180/math.pi
    dx = output[0] - output[1]
    dy = output[2] - output[3]

    if dx == 0:
        ratio = float("inf")
    else:
        ratio = dy/dx

    rad = math.atan(ratio)
    if dx >= 0 and dy >= 0:
        return c*rad
    if dx <= 0 and dy >= 0:
        return abs(abs(c*rad) - 90) + 90
    if dx <= 0 and dy <= 0:
        return c*rad + 180
    if dx >= 0 and dy <= 0:
        return abs(abs(c*rad) - 90) + 270


def thetaError(exp):
    ret = util.readTrials(exp.exp['directory'] + "Unused_Locs.train")

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    dThetas = []
    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])

        try:
            info = ast.literal_eval(inames[trial])
        except:
            pass

        # compute activations and select the output layer
        out = exp.rnn.forward(j, exp.rnn.W)[2]

        # here, i average the values across the 5 output cycles
        output = np.mean(out[-5:,0,:], axis=0)
        target = np.mean(targets[trial][-5:], axis=0)

        # some value between 0 and 360
        diff = calcTheta(target) - calcTheta(output)
        if diff > 180:
            diff = diff - 360
        elif diff < -180:
            diff = diff + 360

        dThetas.append(diff)

    return dThetas
    # pprint(dThetas)

        # eliminate this extra dimension from the outputs.
        # still not exactly sure what this dimension is
        # hidden = hidden[:, 0, :]

def tSNE(exp, test=False):
    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    trialMeans = []

    trialNames = []

    layers=[]

    infos = []

    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])
        info = ast.literal_eval(inames[trial])

        infos.append(info)

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:, 0, :]

        t = "ERROR"
        if info['task'] == "attention":
            t = "Atn"
            tit = "Attention"
        elif info['task'] == "selection":
            t = "Sel"
            tit = "Selection"
        elif info['task'] == 'combined':
            t = "Com"
            tit = "Combined"
        tname = "{}-{}-[{}/{}]".format(t, info['inputs']['choice'],
                                    info['inputs']['cue1'],
                                    info['inputs']['cue2'])
        trialNames.append(tname)

        means = [];

        for unit in range(len(hidden[0])):
            means.append(np.mean(hidden[:, unit]))

        layers.append(hidden)
        trialMeans.append(means)

    trialMeans = np.asarray(trialMeans)
    layers = np.asarray(layers)

    tsne = TSNE(n_components=2, n_iter=10000)

    # If it's a combined task, we don't look at the stim phases,
    # because those are timed differently between task types
    if exp.exp['type'] == "combined":
        start = 15
    else:
        start = 0

    count = start

    for step in range(start, len(inputs[0,:,0])):
        plt.subplot(5,5, count + 1)

        reduced = tsne.fit_transform(layers[:,step,:])
        reduced = np.asarray(reduced)

        
        for label, x, y, info in zip(trialNames, reduced[:, 0], reduced[:, 1], infos):
            if info['task'] == "attention":
                marker = "o"
            else:
                marker = "s"
            if info['inputs']['choice'] == 1:
                loc = info['inputs']['cue1']
                # color = "royalblue"
                # marker = "o"
            else:
                loc = info['inputs']['cue2']
                # color = "crimson"
                # marker = "s"

            color = "k"
            quadrant = float(loc)/float(numLocs)
            if quadrant < 1/8.0:
                color = 'orangered'
            elif quadrant < 2.0/8:
                color = 'orange'
            elif quadrant < 3.0/8:
                color = 'gold'
            elif quadrant < 4.0/8:
                color = 'yellow'
            elif quadrant < 5.0/8:
                color = 'greenyellow'
            elif quadrant < 6.0/8:
                color = 'green'
            elif quadrant < 7.0/8:
                color = 'royalblue'
            elif quadrant < 8.0/8:
                color = 'palevioletred'

            if color == 'k':
                print quadrant
                print loc
                print numLocs

            plt.scatter(x, y, marker=marker, color=color)

        print count
        count += 1
        
    plt.suptitle("{} Experiment, #Locations = {}".format(tit, exp.exp['num_locs']))
    plt.show(block=True)
    exit()

    reduced = tsne.fit_transform(trialMeans)

    # pca = PCA(n_components=2)
    # pca.fit(trialMeans)
    # reduced = pca.transform(trialMeans)

    # print pca.explained_variance_ratio_
    # exit()

    reduced = np.asarray(reduced)

    count = 0
    for label, x, y, info in zip(trialNames, reduced[:, 0], reduced[:, 1], infos):
        # if info['task'] == "attention":
        #     marker = "o"
        # else:
        #     marker = "s"
        if info['inputs']['choice'] == 1:
            loc = info['inputs']['cue1']
            # color = "royalblue"
            marker = "o"
        else:
            loc = info['inputs']['cue2']
            # color = "crimson"
            marker = "s"

        color = "k"
        quadrant = float(loc)/float(numLocs)
        if quadrant < 1/8.0:
            color = 'orangered'
        elif quadrant < 2.0/8:
            color = 'orange'
        elif quadrant < 3.0/8:
            color = 'gold'
        elif quadrant < 4.0/8:
            color = 'yellow'
        elif quadrant < 5.0/8:
            color = 'greenyellow'
        elif quadrant < 6.0/8:
            color = 'green'
        elif quadrant < 7.0/8:
            color = 'royalblue'
        elif quadrant < 8.0/8:
            color = 'palevioletred'

        if color == 'k':
            print quadrant
            print loc
            print numLocs

        plt.scatter(x, y, marker=marker, color=color)

        # if count % 4 == 0:
            # plt.annotate(
            #     label,
            #     xy = (x, y), xytext = (-10, 10),
            #     textcoords = 'offset points', ha = 'right', va = 'bottom',
            #     bbox = dict(boxstyle = 'round,pad=0.5', fc = 'yellow', alpha = 0.5),
            #     arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3,rad=0'))
        count += 1

    plt.title("t-SNE Scatter Plot")
    plt.show()

    X = np.asarray(reduced)
    Z = linkage(X, method='single', metric='cityblock')

    last = Z[-10:, 2]
    last_rev = last[::-1]
    idxs = np.arange(1, len(last) + 1)
    plt.plot(idxs, last_rev)

    acceleration = np.diff(last, 2)  # 2nd derivative of the distances
    acceleration_rev = acceleration[::-1]
    plt.plot(idxs[:-2] + 1, acceleration_rev)
    plt.show()
    k = acceleration_rev.argmax() + 2  # if idx 0 is the max of this we want 2 clusters
    print "clusters:", k

    fancy_dendrogram(Z,
               # max_d=1,
               leaf_rotation=90.,
               leaf_font_size=12.,
               show_contracted=True,
               # annotate_above=10,
               # truncate_mode='lastp',
               # p=16
               )

    plt.show(block=True)

def fancy_dendrogram(*args, **kwargs):
    max_d = kwargs.pop('max_d', None)
    if max_d and 'color_threshold' not in kwargs:
        kwargs['color_threshold'] = max_d
    annotate_above = kwargs.pop('annotate_above', 0)

    ddata = dendrogram(*args, **kwargs)

    if not kwargs.get('no_plot', False):
        plt.title('Hierarchical Clustering Dendrogram (truncated)')
        plt.xlabel('sample index or (cluster size)')
        plt.ylabel('distance')
        for i, d, c in zip(ddata['icoord'], ddata['dcoord'], ddata['color_list']):
            x = 0.5 * sum(i[1:3])
            y = d[1]
            if y > annotate_above:
                plt.plot(x, y, 'o', c=c)
                plt.annotate("%.3g" % y, (x, y), xytext=(0, -5),
                             textcoords='offset points',
                             va='top', ha='center')
        if max_d:
            plt.axhline(y=max_d, c='k')
    return ddata

def genRSAdistribution(exp, neurons=None, test=False, iter=1000,
                       plot=False, printData=False, task=None):
    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    hiddenLayers = []

    stimInfo = []

    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])
        info = ast.literal_eval(inames[trial])

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:, 0, :]

        ######### For calculting conjunction preference ##########
        conj = []
        conj.append(info['inputs']['cue1'])
        conj.append(info['inputs']['cue2'])

        ########## For calculating choice preference ##########
        # if info['inputs']['choice'] == 1:
        #     stimInfo.append(1)
        # elif info['inputs']['choice'] == 2:
        #     stimInfo.append(0)
        # else:
        #     raise Exception("Unkown choice type: {}".append(info['inputs']['choice']))

        if task is not None:
            if info['task'] == "attention":
                if task == "attention":
                    stimInfo.append(conj)
                    hiddenLayers.append(hidden)
            elif info['task'] == "selection":
                if task == "selection":
                    stimInfo.append(conj)
                    hiddenLayers.append(hidden)
            else:
                raise Exception("problem determining task type: {}".format(info['task']))
        else:
            stimInfo.append(conj)
            # hidden[0] = 25 neurons by 1st time step
            # hidden[:,0] = all time steps for 1st neuron
            hiddenLayers.append(hidden)
            # hiddenNeuron.append(hidden[:, neuron])

    hiddenLayers = np.asarray(hiddenLayers)
    corrMatrix = []

    ###### calculate similarity (correlation) matrix for hidden layer ######
    if neurons is None:
        for i in range(len(hiddenLayers)):
            temp = []
            for j in range(len(hiddenLayers)):
                # print util.corr2(hiddenLayers[i],hiddenLayers[j])
                temp.append(util.corr2(hiddenLayers[i], hiddenLayers[j]))
            corrMatrix.append(temp)
    ###### calculate similarity (correlation) matrix for specific neurons ######
    else:
        raise Exception("Find some way to implement this.")

    corrs = []
    firstPrint = True

    for x in range(iter):
        print "Iteration: {} of {}".format(x, iter)
        random.shuffle(stimInfo)
        stimMatrix = []

        # calculate similarity matrix for input data
        count = 0
        for i in stimInfo:
            temp = []
            for j in stimInfo:
                if i[0] == j[0]:
                    if i[1] == j[1]:
                        temp.append(1)
                    else:
                        temp.append(0)
                elif i[0] == j[1]:
                    if i[1] == j[0]:
                        temp.append(1)
                    else:
                        temp.append(0)
                else:
                    temp.append(0)
            stimMatrix.append(temp)

        ###### Just to make sure it looks right #######
        if plot:
            if firstPrint:
                firstPrint = False
                plt.imshow(stimMatrix, interpolation='none')
                plt.show(block=True)

        coef = util.corr2(corrMatrix, stimMatrix)
        corrs.append(coef)

    # fcorrs = open(exp.exp['directory'] + "corr_dist", "wb+")
    # pickle.dump(corrs, fcorrs)
    # fcorrs.close()

    if printData:
        print np.mean(corrs)
        print np.std(corrs)

    if plot:
        plt.hist(corrs)
        plt.show(block=True)
        # plt.imshow(stimMatrix, interpolation='none')
        # plt.show(block=True)

    return corrs

def RSA(exp, test=False, neurons=None, task=None):
    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    trialNames = []

    hiddenLayers = []

    stimInfo = []

    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])
        info = ast.literal_eval(inames[trial])

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:, 0, :]

        conj = []
        conj.append(info['inputs']['cue1'])
        conj.append(info['inputs']['cue2'])

        if task is not None:
            if info['task'] == "attention":
                if task == "attention":
                    stimInfo.append(conj)
                    hiddenLayers.append(hidden)
            elif info['task'] == "selection":
                if task == "selection":
                    stimInfo.append(conj)
                    hiddenLayers.append(hidden)
            else:
                raise Exception("problem determining task type: {}".format(info['task']))
        else:
            stimInfo.append(conj)
            # hidden[0] = 25 neurons by 1st time step
            # hidden[:,0] = all time steps for 1st neuron
            hiddenLayers.append(hidden)
            # hiddenNeuron.append(hidden[:, neuron])

        # if info['inputs']['cue1'] == 1:
        #     stimInfo.append(1)
        # elif info['inputs']['cue2'] == 1:
        #     stimInfo.append(1)
        # else:
        #     stimInfo.append(0)

        # if info['inputs']['choice'] == 1:
        #     stimInfo.append(1)
        # elif info['inputs']['choice'] == 2:
        #     stimInfo.append(0)
        # else:
        #     raise Exception("Unkown choice type: {}".append(info['inputs']['choice']))

        t = "ERROR"
        if info['task'] == "attention":
            t = "Atn"
        elif info['task'] == "selection":
            t = "Sel"
        else:
            raise Exception("Unkown task type: {}".append(info['task']))
        tname = "{}-{}-[{}/{}]".format(t, info['inputs']['choice'],
                                    info['inputs']['cue1'],
                                    info['inputs']['cue2'])
        trialNames.append(tname)

    stimMatrix = []

    # calculate similarity matrix for input data
    for i in stimInfo:
        temp = []
        for j in stimInfo:
            if i[0] == j[0]:
                if i[1] == j[1]:
                    temp.append(1)
                else:
                    temp.append(0)
            elif i[0] == j[1]:
                if i[1] == j[0]:
                    temp.append(1)
                else:
                    temp.append(0)
            else:
                temp.append(0)
        stimMatrix.append(temp)

    # plt.imshow(stimMatrix, interpolation='none')
    # plt.show(block=True)

    hiddenLayers = np.asarray(hiddenLayers)

    corrs = []
    corrMatrix = []
    # doing a neuron by neuron analysis
    if neurons != None:
        for neuron in neurons:
            print "Neuron: {} of {}".format(neuron, len(neurons))

            # # calculate correlation matrix for hidden layer/neuron
            for i in range(len(hiddenLayers)):
                temp = []
                for j in range(len(hiddenLayers)):
                    # print util.corr2(hiddenLayers[i],hiddenLayers[j])
                    temp.append(util.corr2(hiddenLayers[i,:,neuron], hiddenLayers[j,:,neuron]))
                corrMatrix.append(temp)

            coef = util.corr2(corrMatrix, stimMatrix)
            corrs.append(coef)

    # else, do a network wide analysis
    else:
        for i in range(len(hiddenLayers)):
            temp = []
            for j in range(len(hiddenLayers)):
                temp.append(util.corr2(hiddenLayers[i], hiddenLayers[j]))
            corrMatrix.append(temp)
        corrs = [util.corr2(corrMatrix, stimMatrix)]

        print "here"
        print np.asarray(corrMatrix).shape
        plt.imshow(corrMatrix, interpolation='none')
        plt.show(block=True)
    return corrs

def calcDriftPoints(exp, v=1, test=False):
    rnn = exp.rnn

    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    ps = []
    dictp = {}

    for trial in range(len(inputs)):
        info = ast.literal_eval(inames[trial])
        j = np.asarray(inputs[trial])

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:,0,:]

        trialps = []
        for s in range(len(hidden)):
            hid = hidden[s]
            in_ = j[s]

            x = rnn.drift(in_, hid)

            q = round(np.linalg.norm(x),4)
            if q not in dictp:
                dictp[q] = x
                ps.append(x)

        # ps.append(np.asarray(trialps))
        print "Finished Trial {} of {}".format(trial, len(inputs))

        # print ret.x
        # print ret.fun

    fpoints = gzip.open(exp.exp['directory'] + "Drift_Points.gzip.pkl", "wb")
    pickle.dump(ps, fpoints)
    fpoints.close()

    print len(ps)
    return ps

def calcSlowPoints(exp, v=1, test=False):
    rnn = exp.rnn

    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    points = []

    for trial in range(len(inputs)):
        info = ast.literal_eval(inames[trial])
        j = np.asarray(inputs[trial])

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:,0,:]

        trialps = []
        for s in range(len(hidden)):
            hid = hidden[s]
            in_ = j[s]
            args = (rnn, in_)

            # x = np.concatenate([in_, hid])

            x = hid

            q = util.q

            if v==2:
                ret = minimize(fun=q, x0=x, args=args, tol=0.1)
            elif v==1:
                ret = minimize(fun=q, x0=x, args=args)
            elif v==3:
                ret = minimize(fun=q, x0=x, args=args, tol=0.01)
            elif v==4:
                W, b = rnn.get_layer(rnn.W, 1)
                jac = util.getJacobian
                hes = util.getGaussNewton
                # print callable(jac)
                # print callable(hes)
                # exit()
                ret = minimize(fun=q, x0=x, args=args, method='Newton-CG', jac=jac, hess=hes)
                exit()
            else:
                raise Exception()

            recslow = ret.x
            if ret.success:
                trialps.append(recslow)
            else:
                trialps.append(np.zeros(len(recslow)))

        points.append(np.asarray(trialps))
        print "Finished Trial {} of {}".format(trial, len(inputs))

        # print ret.x
        # print ret.fun

    if v==1:
        fpoints = gzip.open(exp.exp['directory'] + "Slow_Points.gzip.pkl", "wb")
    else:
        fpoints = gzip.open(exp.exp['directory'] + "Slow_PointsV{}.gzip.pkl".format(v), "wb")

    pickle.dump(points, fpoints)
    fpoints.close()

    exit()

    # t1 = 3, 8 give stable combos
    # t1 = [3, 7, 8, 9]
    for t1 in [3, 7, 8, 9]:
        t1info = ast.literal_eval(inames[t1])
        t1c1 = t1info['inputs']['cue1']
        t1c2 = t1info['inputs']['cue2']
        t2 = -1
        count = t1 + 1
        while t2 == -1:

            cinfo = ast.literal_eval(inames[count])
            cc1 = cinfo['inputs']['cue1']
            cc2 = cinfo['inputs']['cue2']

            if cc1 == t1c2:
                if cc2 == t1c1:
                    t2 = count

            count += 1

        rnn = exp.rnn

        inputt1 = np.asarray(inputs[t1])
        inputt2 = np.asarray(inputs[t2])

        hidden = rnn.forward(inputt1, rnn.W)[1]
        hidden = hidden[:,0,:]

        hid = hidden[11]
        in_ = inputt1[11]

        # x = np.concatenate([in_, hid])

        rec1 = rnn.drift(in_, hid, bias=True)

        in_[0:-4] = [0 for _ in range(len(in_[0:-4]))]
        in_[-4:] = [0, 1, 0, 0]

        out1 = util.activate(rnn, in_, rec1, return_out=True)

        hidden = rnn.forward(inputt2, rnn.W)[1]
        hidden = hidden[:,0,:]

        hid = hidden[11]
        in_ = inputt2[11]

        # x = np.concatenate([in_, hid])

        rec2 = rnn.drift(in_, hid, bias=True)
        out2 = util.activate(rnn, in_, rec2, return_out=True)
        print out2

        drec = np.linalg.norm(rec1-rec2)
        count = 1
        while drec > 0.001:
            print "trying again: {}".format(drec)
            rec2 = util.activate(rnn, in_, rec2)
            out2 = util.activate(rnn, in_, rec2, return_out=True)
            print out2
            drec = np.linalg.norm(rec1-rec2)
            count += 1
            if count > 5:
                break

        drec = np.linalg.norm(rec1-rec2)

        in_[0:-4] = [0 for _ in range(len(in_[0:-4]))]
        in_[-4:] = [0, 1, 0, 0]

        dout = np.linalg.norm(out1-out2)

        print "Locs: {}/{}, Rec Norm: {}, Out Norm: {}".format(t1c1, t1c2, 
                                                               drec,
                                                               dout)
        print "###############\n"

    exit()

    args = [rnn]
    q = util.q(x, *args)
    print q

    exit()

def showActs(exp, test=False, task=None, ansDrift=False):
    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    rnn = exp.rnn

    cs = ['red', 'orange', 'yellow',
          'green', 'royalblue', 'palevioletred']
    count = 0
    color = cs[0]

    moresteps=100

    # trials of interest 1, 20, 521, 149
    # Trial 521 of interest as well, goes 15 -> 0

    # steps = [15,16,17,18,19]
    # steps=[17,18,19]
    steps = [17,18,19]
    part = "Selection"

    # steps=[21,22]
    # moresteps = 20
    # steps=[0,1,2]
    # steps = []

    # interesting trials for selection93
    # 20 for horizontal osciallation
    # 27, 223, 350, 484 for vertical osciallation

    trials = range(len(inputs))
    trials = [20,23,24,25]

    for trial in trials:
        info = ast.literal_eval(inames[trial])
        tTask = info['task']

        doTrial = True
        if task is not None:
            if tTask != task:
                doTrial = False

        if doTrial:
            j = np.asarray(inputs[trial])

            if info['inputs']['choice'] == 1:
                falsecue = info['inputs']['cue2']
                cue = info['inputs']['cue1']

                # j[12][0:numLocs] = [0 for i in range(numLocs)]
                # j[13][0:numLocs] = [0 for i in range(numLocs)]
                # j[14][0:numLocs] = [0 for i in range(numLocs)]

            elif info['inputs']['choice'] == 2:
                falsecue = info['inputs']['cue1']
                cue = info['inputs']['cue2']

                # j[6][0:numLocs] = [0 for i in range(numLocs)]
                # j[7][0:numLocs] = [0 for i in range(numLocs)]
                # j[8][0:numLocs] = [0 for i in range(numLocs)]

            # Now plot the actual cue
            targets, spaces = ipgv2.createTargets(numLocs)
            cueout = targets[cue]
            x = cueout[0] - cueout[1]
            y = cueout[2] - cueout[3]
            plt.scatter(x, y, s=110, c='g', marker='s')

            acts = rnn.forward(j, rnn.W)

            hidden = acts[1]
            hidden = hidden[:,0,:]

            outs = acts[2]
            out = outs[-1, 0, :]

            x = out[0] - out[1]
            y = out[2] - out[3]

            plt.scatter(x, y, s=90, c='b', marker='*')

            # Now plot the false cue
            targets, spaces = ipgv2.createTargets(numLocs)
            falseout = targets[falsecue]

            x = falseout[0] - falseout[1]
            y = falseout[2] - falseout[3]

            plt.scatter(x, y, s=110, c='r', marker='s')

            for step in steps:

                hid = hidden[step]
                in_ = j[step]

                # in_[-2:] = [0 for i in range(2)]

                if ansDrift:
                    # recs = [rnn.drift(in_, hid, single_ret=True)]
                    recs = rnn.drift(in_, hid, ret_seq=True)
                else:
                    recs = [hid]

                in_stop = list(in_)
                in_stop[-4:] = [0, 1, 0, 0]

                # recout = rnn.drift(in_, rec, single_ret=True)
                # out = util.activate(rnn, in_, recout, return_out=True)

                for rec in recs:
                    out = util.activate(rnn, in_stop, rec, return_out=True)

                    x = out[0] - out[1]
                    y = out[2] - out[3]

                    plt.scatter(x, y, s=100, c=color, marker='*')

                    count += 1
                    color = cs[count % len(cs)]

            if moresteps != 0:
                hid = hidden[steps[-1]]
                in_ = j[steps[-1]]

                in_stop = list(in_)
                in_stop[-4:] = [0, 1, 0, 0]

                for t in range(moresteps):
                    # advance hidden one step
                    hid = util.activate(rnn, in_, hid)
                    out = util.activate(rnn, in_stop, hid, return_out=True)

                    x = out[0] - out[1]
                    y = out[2] - out[3]

                    plt.scatter(x, y, s=100, c=color, marker='*')

        fig = plt.gcf()
        circle=plt.Circle((0,0),1,color='k',fill=False)
        ax = plt.gca()
        fig.gca().add_artist(circle)

        tit = '''Saccade Response During RNN Relaxation:
    {} Task, {}, Trial #{}'''.format(exp.exp['type'].capitalize(), part, trial)
        plt.title(tit)
        plt.axis([-1.2, 1.2, -1.2, 1.2])
        plt.axhline(linewidth=0.5, color="black")
        plt.axvline(linewidth=0.5, color="black")
        plt.show(block=True)
        plt.clf()

    exit()

    trials = [1]
    for trial in trials:
        in_ = np.asarray(inputs[trial])

        outs = rnn.forward(in_, rnn.W)[2]
        out = outs[-1, 0]

        x = out[0] - out[1]
        y = out[2] - out[3]

        plt.scatter(x, y, s=100, c='g', marker='s')

        # in_[12][-4:] = [1, 0, 0, 0]
        in_[15][-4:] = in_[13][-4:]
        # in_[13][-4:] = [1, 0, 0, 0]

        outs = rnn.forward(in_, rnn.W)[2]
        out = outs[-1, 0]

        x = out[0] - out[1]
        y = out[2] - out[3]

        x1 = x
        y1 = y
        # plt.scatter(x, y, s=100, c='g', marker='*')

        count += 1
        color = cs[count % len(cs)]

        in_[12][-4:] = [1, 0, 0, 1]
        in_[13][-4:] = [1, 0, 0, 1]
        in_[14][-4:] = [1, 0, 0, 1]

        outs = rnn.forward(in_, rnn.W)[2]
        out = outs[-1, 0]

        x = out[0] - out[1]
        y = out[2] - out[3]

        plt.scatter(x, y, s=100, c='r', marker='s')
        plt.scatter(x1, y1, s=120, c='g', marker='*')

        in_[12][-4:] = [1, 0, 0, 0]
        # in_[15][-4:] = in_[13][-4:]

        outs = rnn.forward(in_, rnn.W)[2]
        out = outs[-1, 0]

        x = out[0] - out[1]
        y = out[2] - out[3]

        # plt.scatter(x, y, s=100, c='r', marker='*')

        print "\n######################################\n"

        count += 1
        color = cs[count % len(cs)]

    fig = plt.gcf()
    circle=plt.Circle((0,0),1,color='k',fill=False)
    ax = plt.gca()
    fig.gca().add_artist(circle)

    tit = '''Saccade Response on Shifted Selection Cue:
{} Task, {}'''.format(exp.exp['type'].capitalize(), part, trial)

    plt.title(tit)
    plt.axis([-1.2, 1.2, -1.2, 1.2])
    plt.axhline(linewidth=0.5, color="black")
    plt.axvline(linewidth=0.5, color="black")
    plt.show(block=True)

    exit()

    fpoints = gzip.open(exp.exp['directory'] + "Slow_Points.gzip.pkl", "rb")
    points = pickle.load(fpoints)
    fpoints.close()

    for trial in trials:
        print points[trial][10]

        j = np.asarray(inputs[trial])

        acts = rnn.forward(j, rnn.W)
        hidden = acts[1][:,0,:]

        hid = hidden[10]
        in_ = j[10]

        # x = np.concatenate(in_, hid)

        rec, oldrec = rnn.drift(in_, hid, bias=False)
        print rec
        print oldrec

        print "\n######################################\n"

def regressionSpace(exp, orthogonal=True, delay_only=False):
    fcoefs = gzip.open(exp.exp['directory'] + "coefs.gzip.pkl", "rb")
    coefs = pickle.load(fcoefs)
    fcoefs.close()

    coefsNorm = []
    for var in range(len(coefs)):
        maxNorm =  0
        maxi = -1
        for step in range(len(coefs[var])):
            if delay_only:
                if step not in [0,1,2,6,7,8,12,13,14,20,21,22]:
                    norm = np.linalg.norm(coefs[var][step])
                    if norm > maxNorm:
                        maxNorm = norm
                        maxi = step
            else:
                norm = np.linalg.norm(coefs[var][step])
                if norm > maxNorm:
                    maxNorm = norm
                    maxi = step
        coefsNorm.append(coefs[var][maxi])

    coefsNorm = np.asarray(coefsNorm)
    coefsNorm = np.swapaxes(coefsNorm, 0, 1)

    if orthogonal:
        Q, R = np.linalg.qr(coefsNorm, mode="reduced")
        return Q
    else:
        return coefsNorm

def plotWeightDist(exp):
    rnn = exp.rnn
    W = rnn.W

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    info0 = ast.literal_eval(inames[0])
    cue1 = info0['inputs']['cue1']
    cue2 = info0['inputs']['cue2']

def plotPCdrift(exp, test=False, d3=False):
    rnn = exp.rnn

    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    info0 = ast.literal_eval(inames[0])
    cue1 = info0['inputs']['cue1']
    cue2 = info0['inputs']['cue2']

    # trials1 = []
    # trials2 = []

    # for t in range(len(inputs)):
    #     info = ast.literal_eval(inames[t])

    #     if info['inputs']['choice'] == 1:
    #         if info['inputs']['cue1'] == cue1:
    #             trials1.append(t)
    #         elif info['inputs']['cue1'] == cue2:
    #             trials2.append(t)
    #     elif info['inputs']['choice'] == 2:
    #         if info['inputs']['cue2'] == cue1:
    #             trials1.append(t)
    #         elif info['inputs']['cue2'] == cue2:
    #             trials2.append(t)

    if exp.exp['type'] == "selection":
        pc1 = getPCA(exp, steps=[1,2])
        pc2 = getPCA(exp, steps=[7,8])
        pc3 = getPCA(exp, steps=[13,14])
        # pc3 = getPCA(exp, steps=[21, 22])
    elif exp.exp['type'] == "attention":
        pc1 = getPCA(exp, steps=[7,8])
        pc2 = getPCA(exp, steps=[13,14])
        pc3 = getPCA(exp, steps=[1,2])
        # pc3 = getPCA(exp, steps=[21,22])
    else:
        raise Exception("Can only do this for attention/selection task right now.")


    # pc1 = getPCA(exp, steps=[20, 21, 22])
    # pc2 = getPCA(exp, steps=[6,7,8])

    # pc1 = getPCA(exp, steps=[19, 20], trials=trials1)
    # pc2 = getPCA(exp, steps=[19, 20], trials=trials2)

    # print pc1.explained_variance_ratio_
    # print pc2.explained_variance_ratio_
    # exit()

    # 1, 20, 23, 149, for selection92
    # 20 is super nice for selection 92

    # for step 1 and 2
    ci = 0
    cs = ['r', 'g', 'b', 'crimson', 'k', 'k', 'k']
    c = cs[ci]

    # trials = range(5)
    # trials = [100,24,25]
    trials = [0,1,2,3,4,5,6]
    # trials = [20]

    fig = plt.figure()
    if d3:
        ax = fig.add_subplot(111, projection='3d')
        ax = Axes3D(fig)
    else:
        ax = fig.add_subplot(111)

    for t in trials: 

        # fig = plt.figure()
        # if d3:
        #     ax = fig.add_subplot(111, projection='3d')
        #     ax = Axes3D(fig)
        # else:
        #     ax = fig.add_subplot(111)

        info = ast.literal_eval(inames[t])

        j = np.asarray(inputs[t])
        j_copy = copy.copy(j)

        # Switch the selection parameter

        j_copy[12][-2] = j[12][-1]
        j_copy[13][-2] = j[13][-1]
        j_copy[14][-2] = j[14][-1]
        j_copy[12][-1] = j[12][-2]
        j_copy[13][-1] = j[13][-2]
        j_copy[14][-1] = j[14][-2]
        # j_copy[12][-2:] = [1, 0]
        # j_copy[13][-2:] = [1, 0]
        # j_copy[14][-2:] = [1, 0]


        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:,0,:]

        hiddenswitch = rnn.forward(j_copy, rnn.W)[1]
        hiddenswitch = hiddenswitch[:,0,:]

        # steps = [9,10,11]
        # part = "Sample 2"

        steps = [17, 18, 19]
        part = "Delay"

        # steps = [12,13,14]
        # part = "Selection"

        # steps = range(23)
        # part = "All"

        # steps = [20,21,22]
        # part = "Output"

        # steps = [0,1,2]
        # part = "Sample 1"

        # steps = [2, 18]
        # part = "Sample 1 and Delay"

        hids = [hidden, hiddenswitch]
        js = [j, j_copy]

        for a in range(1):
            for step in steps:

                hid = hids[a][step]
                in_ = js[a][step]

                # hid=hidden[step]
                # in_ = j[step]

                # in_[0:numLocs] = [0 for i in range(numLocs)]
                # in_[-2:] = [0 for i in range(2)]

                hidp1 = pc1.transform(hid.reshape(1,-1))[0,0]
                hidp2 = pc2.transform(hid.reshape(1,-1))[0,0]
                hidp3 = pc3.transform(hid.reshape(1,-1))[0,0]

                recseq = rnn.drift(in_, hid, ret_seq=True)

                recsp1s = pc1.transform(recseq)[:,0]
                recsp2s = pc2.transform(recseq)[:,0]
                recsp3s = pc3.transform(recseq)[:,0]

                if d3:
                    coor1 = [hidp1, hidp2, hidp3]
                else:
                    coor1 = [hidp1, hidp2]
                coors2 = []
                coors2.append(coor1)
                for k in range(len(recsp1s)):
                    if d3:
                        coors2.append([recsp1s[k], recsp2s[k], recsp3s[k]])
                    else:
                        coors2.append([recsp1s[k], recsp2s[k]])
                
                coors2 = np.asarray(coors2)

                if d3:
                    ax.scatter(coor1[0], coor1[1], coor1[2], color=c, marker='s', s=30)
                    ax.plot(coors2[:, 0], coors2[:, 1], coors2[:, 2], color=c, ls="--")
                    ax.scatter(coors2[-1][0], coors2[-1][1], coors2[-1][2], color=c, marker='*',s=30)
                else:
                    ax.scatter(coor1[0], coor1[1], color=c, marker='s', s=30)
                    ax.plot(coors2[:, 0], coors2[:, 1], color=c, ls="--")
                    ax.scatter(coors2[-1][0], coors2[-1][1], color=c, marker='*',s=30)

                # ci += 1
                # c = cs[ci % len(cs)]

                # # Now drift again with an answer presentation
                # finalrec = recseq[-1]
                # in_[-4:] = [0, 1, 0, 0]

                # hidp1 = pc1.transform(finalrec.reshape(1,-1))[0,0]
                # hidp2 = pc2.transform(finalrec.reshape(1,-1))[0,0]
                # hidp2 = pc3.transform(finalrec.reshape(1,-1))[0,0]

                # recseqout = rnn.drift(in_, finalrec, ret_seq=True)

                # recsp1s = pc1.transform(recseqout)[:,0]
                # recsp2s = pc2.transform(recseqout)[:,0]
                # recsp3s = pc3.transform(recseqout)[:,0]

                # if d3:
                #     coor1 = [hidp1, hidp2, hidp3]
                # else:
                #     coor1 = [hidp1, hidp2]
                # coors2 = []
                # coors2.append(coor1)
                # for k in range(len(recsp1s)):
                #     if d3:
                #         coors2.append([recsp1s[k], recsp2s[k], recsp3s[k]])
                #     else:
                #         coors2.append([recsp1s[k], recsp2s[k]])
                
                # coors2 = np.asarray(coors2)
                # if d3:
                #     ax.scatter(coor1[0], coor1[1], coor1[2], color=c, marker='s', s=30)
                #     ax.plot(coors2[:, 0], coors2[:, 1], coors2[:, 2], color=c, ls="--")
                #     ax.scatter(coors2[-1][0], coors2[-1][1], coors2[-1][2], color=c, marker='*',s=30)
                # else:
                #     ax.scatter(coor1[0], coor1[1], color=c, marker='s', s=30)
                #     ax.plot(coors2[:, 0], coors2[:, 1], color=c, ls="--")
                #     ax.scatter(coors2[-1][0], coors2[-1][1], color=c, marker='*',s=30)

                # ci += 1
                # c = cs[ci % len(cs)]

            ci += 1
            c = cs[ci % len(cs)]

    tit = '''RNN Relaxation along Task PC's:
{} Task, {}, Trial #{}'''.format(exp.exp['type'].capitalize(), part, t)
    plt.title(tit)
    ax.set_xlabel('PC Sample 1')
    ax.set_ylabel('PC Sample 2')
    if d3:
        ax.set_zlabel('PC Selection Cue')
    plt.axis([-1.2, 1.2, -1.2, 1.2])

    plt.show(block=True)
    plt.clf()
        

def plotSlowPoints(exp, v=1, test=False):
    rnn = exp.rnn

    if test:
        ret = exp.getTestInputs()
    else:
        ret = exp.getTrainInputs()

    numLocs = exp.exp['num_locs']

    inputs = ret['inputs']
    targets = ret['targets']
    inames = ret['inputNames']

    # Get the subspace
    Q = regressionSpace(exp, orthogonal=True, delay_only=True)

    # points = uniqueStablePs(exp, v=v)
    points = calcDriftPoints(exp)

    # if v==1:
    #     fpoints = gzip.open(exp.exp['directory'] + "Slow_Points.gzip.pkl", "rb")
    # elif v==2:
    #     fpoints = gzip.open(exp.exp['directory'] + "Slow_PointsV2.gzip.pkl", "rb")
    # else:
    #     raise Exception("Unknown version")
    # points = pickle.load(fpoints)
    # fpoints.close()

    # trials = range(len(inputs))
    trials = [0, 1, 2]

    cs = ['r', 'b', 'k', 'g']
    c = cs[0]

    count = 0
    ci = 0

    # ax = plt.axes(projection='3d')
    ax = plt.axes()

    for p in points:

        x = Q[:, 1].dot(p)
        z = Q[:, 3].dot(p)
        y = Q[:, 5].dot(p)

        # # plt.scatter(x, y, marker="o", color='g')
        # ax.scatter(x, y, z, marker="o", color='g')
        ax.scatter(x, y, marker="o", color='g')

    ax.set_xlabel('X axis')
    ax.set_ylabel('Y axis')
    # ax.set_zlabel('Z axis')
    plt.show(block=True)
    exit()

    for trial in trials:
        projx = []
        projy = []
        for s in range(1, len(points[trial])):
            if sum(points[trial][s]) != 0:
                print s
                x = Q[:, 1].dot(points[trial][s])
                y = Q[:, 5].dot(points[trial][s])
                # x = Q[:, 2]*points[trial][s]
                # y = Q[:, 4]*points[trial][s]
                print [x,y]
                # plt.scatter(x, y)
                projx.append(x)
                projy.append(y)
            else:
                count += 1

        c = cs[ci % len(cs)]
        ci += 1

        plt.scatter(projx[0], projy[0], marker="s", color=c)
        plt.plot(projx, projy, color=c)
        plt.scatter(projx[-1], projy[-1], marker="*", color=c)

    print "Number of Non-slowpoints: {}".format(count)
    plt.show(block=True)

def uniqueStablePs(exp, v=1):
    if v==1:
        fpoints = gzip.open(exp.exp['directory'] + "Slow_Points.gzip.pkl", "rb")
    elif v==2:
        fpoints = gzip.open(exp.exp['directory'] + "Slow_PointsV2.gzip.pkl", "rb")
    elif v==3:
        fpoints = gzip.open(exp.exp['directory'] + "Slow_PointsV3.gzip.pkl", "rb")
    else:
        raise Exception("Unknown version")

    points = pickle.load(fpoints)
    fpoints.close()

    pdict = {}
    ps = []

    count = 0

    for trial in range(len(points)):
        for s in range(len(points[trial])):
            p = points[trial][s]
            q = round(np.linalg.norm(p), 5)
            if q not in pdict:
                pdict[q] = p
                ps.append(p)
            count += 1

    return ps

    # for key in pdict:
    #     print key

def main():
    
    ####################################################################################
    # For making some firing rate plots
    ####################################################################################

    exp = e.experiment()

    ################ didn't generalize ##################
    # exp.read("experiments/selection82/selection82.exp", loadW=True)
    # exp.read("experiments/attention40/attention40.exp", loadW=True)
    # exp.read("experiments/combined2/combined2.exp", loadW=True)



    ################# exps_set2: didn't generalized ################
    # exp.read("exps_set2/selection249/selection249.exp", loadW=True)

    ################# exps_set2: generalized #######################
    # exp.read("exps_set2/attention95/attention95.exp", loadW=True)
    # exp.read("exps_set2/attention256/attention256.exp", loadW=True)

    # exp.read("exps_set2/selection106/selection106.exp", loadW=True)
    # exp.read("exps_set2/selection256/selection256.exp", loadW=True)

    # exp.read("exps_set2/combined86/combined86.exp", loadW=True)
    # exp.read("exps_set2/combined246/combined246.exp", loadW=True)

    ################ exps_set3: didn't generalize ##################
    # exp.read("exps_set3/attention3/attention3.exp", loadW=True)
    # exp.read("exps_set3/selection17/selection17.exp", loadW=True)
    # exp.read("exps_set3/selection100/selection100.exp", loadW=True)

    ################# exps_set3: generalized #######################
    ### attention
    # exp.read("exps_set3/attention53/attention53.exp", loadW=True)
    # exp.read("exps_set3/attention93/attention93.exp", loadW=True)


    ### selection
    # exp.read("exps_set3/selection93/selection93.exp", loadW=True)

    exp.read("exps_set3/selection89/selection89.exp", loadW=True)
    # exp.read("exps_set3/selection99/selection99.exp", loadW=True)


    ### combined
    # exp.read("exps_set3/combined63/combined63.exp", loadW=True)

    

    ############################################################
    ############################################################
    # Testing Jacobian Funciton
    ############################################################
    # rnn = exp.rnn
    # W_r, b_r = rnn.get_layer(rnn.W, 1)
    # ret = exp.getTrainInputs()

    # inputs = ret['inputs']
        
    # j = np.asarray(inputs[0])

    # hid = rnn.forward(j, rnn.W)[1]
    # hid = hid[4, 0, :]

    # gn = util.getGaussNewton(hid, rnn, W_r)
    # print gn.shape
    # exit()
    ############################################################
    ############################################################



    # corrs = RSA(exp)
    # print corrs



    # uniqueStablePs(exp)



    # genRSAdistribution(exp, printData=True, plot=True, task="selection")



    # FRplot(exp, trials=trials, neurons=neurons)



    # linearModel(exp)



    # regressionSpace(exp, delay_only=True)



    # calcSlowPoints(exp, v=4)



    # plotSlowPoints(exp)



    # tSNE(exp)




    # plotPCdrift(exp)
    plotPCdrift(exp, d3=True)



    plotPCproj(exp, d3=True)



    # plotWeightDist(exp)




    # pcaProjection(exp, numComponents=3)
    # pcaProjection(exp, numComponents=3, task="attention")
    # pcaProjection(exp, numComponents=3, task="selection")

    # pcaProjection(exp, numComponents=3, delay_only=True)
    # pcaProjection(exp, numComponents=3, selection_delay_only=True)



    # showActs(exp, ansDrift=False, task="selection")
    # showActs(exp, task="selection", ansDrift=True)



    exit()

    matplotlib.interactive(True)
    if len(sys.argv) < 2:
        raise Exception("Please specify an experiments root directory for analysis:\n"
            "Usage: python analysis.py [directory]")
    else:
        expRoot = sys.argv[1]

    ####################################################################################
    # For computing the trianing, testing, and theta errors of each experiment
    ####################################################################################
    testErrors = []
    trainErrors = []

    for expType in ['selection', 'attention', 'combined']:
        expNum = 93
        expPath = "{}/{}{}/{}{}.exp".format(expRoot, expType, expNum, expType, expNum)

        while (os.path.exists(expPath)):
            try:
                exp = e.experiment()
                exp.read(expPath, loadW=True)
                if exp.exp['train_pct'] < 100:
                    testErrors.append(["{}{}: pct={}, locs={}, layer={}".format(expType, expNum,
                                                                                exp.exp['train_pct'],
                                                                                exp.exp['num_locs'], 
                                                                                exp.exp['hidden_layer']),
                                      exp.testError()])
                    fthetas = open("{}/{}{}/Theta_Errors".format(expRoot, expType, expNum), "wb+")
                    thetas = thetaError(exp)
                    pprint(thetas, stream=fthetas)
                    plt.hist(thetas, 45, normed=1, facecolor='green', alpha=0.75)
                    plt.savefig("{}/{}{}/thetas_clear.pdf".format(expRoot, expType, expNum), format="pdf")
                    plt.clf()
                trainErrors.append(["{}{}: pct={}, locs={}, layer={}".format(expType, expNum,
                                                                             exp.exp['train_pct'],
                                                                             exp.exp['num_locs'], 
                                                                             exp.exp['hidden_layer']),
                                   exp.trainError()])
            except:
                print "Could not analyze exp: {}{}".format(expType, expNum)
            print "Finished reading exp"
            expNum += 1
            expPath = "{}/{}{}/{}{}.exp".format(expRoot, expType, expNum, expType, expNum)
            
    # testErrors = sorted(testErrors,key=lambda x: x[1])
    # trainErrors = sorted(trainErrors,key=lambda x: x[1])

    # ftrain = open("{}/Train_Errors".format(expRoot), "wb+")
    # ftest = open("{}/Test_Errors".format(expRoot), "wb+")
    # pprint(testErrors, stream=ftest)
    # pprint(trainErrors, stream=ftrain)

if __name__ == "__main__":
    main()
import ast
import random
import math
import os
import sys
import matplotlib
import pickle

import numpy as np
import utility as util
import experiment as e

# import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d, Axes3D
from scipy.cluster.hierarchy import dendrogram, linkage
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

def pcaProjection(exp, numComponents=3, trials=None, test=False, task=None):

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
    attActs = None
    selActs = None

    attTrials = []
    selTrials = []

    specAtts = []
    specSels = []

    pcaComb = PCA(n_components=numComponents)
    pcaAtt = PCA(n_components=numComponents)
    pcaSel = PCA(n_components=numComponents)

    if trials is None:
        trials = [1, 10, 11, 12]

    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])

        info = ast.literal_eval(inames[trial])
        infos.append(info)

        hidden = rnn.forward(j, rnn.W)[1]
        hidden = hidden[:, 0, :]

        if task == "attention":
            if info['task'] == "attention":
                if info['inputs']['cue1'] == 1:
                    if info['inputs']['choice'] == 1:
                        specAtts.append(trial)
                attTrials.append(trial)
                if attActs is None:
                    attActs = hidden
                else:
                    attActs = np.concatenate((attActs, hidden))
        elif task == "selection":
            if info['task'] == "selection":
                if info['inputs']['cue1'] == 1:
                    if info['inputs']['choice'] == 1:
                        specSels.append(trial)
                selTrials.append(trial)
                if selActs is None:
                    selActs = hidden
                else:
                    selActs = np.concatenate((selActs, hidden))

        if stateActs is None:
            stateActs = hidden
        else:
            stateActs = np.concatenate((stateActs, hidden))

        trial_acts.append(hidden)

    # trial_acts = np.asarray(trial_acts)
    # print trial_acts[0].shape

    
    if attActs is not None:
        pcaAtt.fit(attActs)
        print pcaAtt.explained_variance_ratio_
    if selActs is not None:
        pcaSel.fit(selActs)
        print pcaSel.explained_variance_ratio_
    pcaComb.fit(stateActs)
    print pcaComb.explained_variance_ratio_

    plt.plot(pcaComb.explained_variance_ratio_)
    plt.show(block=True)

    exit()

    all_reduced = []
    count = 1

    # First, the row of only att trials
    for i in specAtts[0:3]:
        plt.subplot(1, 3, count) # hard coded??? SHAME!

        # fig = plt.figure()
        # ax = fig.add_subplot(111)

        # # ax = fig3d.add_subplot(111, projection='3d')
        # ax = Axes3D(fig3d)

        count += 1
        # stuff = np.zeros((len(inputs[0]), numComponents))

        acts_reduced = pcaAtt.transform(trial_acts[i])
        acts_reduced = np.asarray(acts_reduced)

        plt.plot(acts_reduced)

        # x = acts_reduced[:,0]
        # y = acts_reduced[:,1]
        # z = acts_reduced[:,2]

        # for comp in range(numComponents):
        #     stuff[:, comp] = acts_reduced[:, comp]
        # stuff = np.asarray(stuff)

        # plt.plot(stuff)
        # ax.plot(x,y)
        # ax.plot(x,y,z)

        plt.title(infos[i]['task'] + ", Trl: " + str(i) + ", " +
                    ", Chc: " + str(infos[i]['inputs']['choice']) +
                    ", Locs: " + 
                    str(infos[i]['inputs']['cue1']) + "/" + 
                    str(infos[i]['inputs']['cue2']))

        # plt.show(block=True)
        # plt.clf()
    plt.show(block=True)
    plt.clf()

    count = 1
    # Next, the row of only sel trials
    for i in specSels[0:3]:
        plt.subplot(1, 3, count) # hard coded??? SHAME!

        count += 1
        # stuff = np.zeros((len(inputs[0]), numComponents))

        acts_reduced = pcaSel.transform(trial_acts[i])
        acts_reduced = np.asarray(acts_reduced)

        plt.plot(acts_reduced[:, -3:])

        plt.title(infos[i]['task'] + ", Trl: " + str(i) + ", " +
                    ", Chc: " + str(infos[i]['inputs']['choice']) +
                    ", Locs: " + 
                    str(infos[i]['inputs']['cue1']) + "/" + 
                    str(infos[i]['inputs']['cue2']))
        
    plt.show(block=True)
    
    # and the combined, finally
    count = 1
    for i in trials[0:3]:
        plt.subplot(1, 3, count) # hard coded??? SHAME!

        count += 1
        # stuff = np.zeros((len(inputs[0]), numComponents))

        acts_reduced = pcaComb.transform(trial_acts[i])
        acts_reduced = np.asarray(acts_reduced)

        plt.plot(acts_reduced[:, -3:])

        plt.title(infos[i]['task'] + ", Trl: " + str(i) + ", " +
                    ", Chc: " + str(infos[i]['inputs']['choice']) +
                    ", Locs: " + 
                    str(infos[i]['inputs']['cue1']) + "/" + 
                    str(infos[i]['inputs']['cue2']))
        
    plt.show(block=True)

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

        trow.append(sin1*cos1*sin2*cos2)

        trow.append(sin1*sin2)

        trow.append(cos1*cos2)

        trow.append(sin1*cos1)
        
        trow.append(sin2*cos2)

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
        rit = zlayers[:,t,neuron]
        F = np.swapaxes(predictors, 0, 1)

        ###### Equ: Bs = inv(F*F.transpose())*F*rit #######
        arg1 = F.dot(F.transpose())
        arg2 = inv(arg1)
        Bs = arg2.dot(F).dot(rit)
        
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


        # mean firing rates
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
        print lassocv.get_params()
        print
        c = np.asarray(lassocv.coef_)
        # for x in range(len(c)):
        #     print c[x]
        print c[1]
        print c[6]
        print c[11]
        exit()
        if count > 5:
            exit()
        count += 1

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
        elif info['task'] == "selection":
            t = "Sel"
        elif info['task'] == 'combined':
            t = "Com"
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
        start = 13
    else:
        start = 0

    count = start

    for step in range(start, len(inputs[0,:,0])):
        plt.subplot(5,5, count)

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

    plt.imshow(stimMatrix, interpolation='none')
    plt.show(block=True)

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

    return corrs


def main():
    
    ####################################################################################
    # For making some firing rate plots
    ####################################################################################

    exp = e.experiment()

    ######## didn't generalize ##########
    # exp.read("experiments/selection82/selection82.exp", loadW=True)
    # exp.read("experiments/attention40/attention40.exp", loadW=True)
    # exp.read("experiments/combined2/combined2.exp", loadW=True)

    ######### generalized ###############
    # exp.read("exps_set2/attention95/attention95.exp", loadW=True)
    # exp.read("exps_set2/attention256/attention256.exp", loadW=True)

    exp.read("exps_set2/selection106/selection106.exp", loadW=True)
    # exp.read("exps_set2/selection256/selection256.exp", loadW=True)

    # exp.read("exps_set2/combined86/combined86.exp", loadW=True)
    # exp.read("exps_set2/combined246/combined246.exp", loadW=True)

    # ret = exp.getTrainInputs()

    # numLocs = exp.exp['num_locs']

    # inputs = ret['inputs']
    # targets = ret['targets']
    # inames = ret['inputNames']

    # # neurons = [1, 3, 7, 9, 10, 11, 15, 16, 21, 23, 24]
    # choice1ts = []
    # choice2ts = []

    # neurons = [2, 5, 18, 19]

    # for trial in range(len(inputs)):
    #     info = ast.literal_eval(inames[trial])

    #     if info['inputs']['cue1'] == 0:
    #         choice1ts.append(trial)
    #     elif info['inputs']['cue2'] == 0:
    #         choice1ts.append(trial)
    #     if info['inputs']['cue1'] == 1:
    #         choice2ts.append(trial)

    # trials = choice1ts[0:3] + choice2ts[0:3]

    # plt.suptitle("Exp Name: {}, Locs: {}, Hidden Size: {}".format(exp.exp['name'], exp.exp['num_locs'],
    #                                                               exp.exp['hidden_layer'], fontsize=13))


    # corrs = RSA(exp, task="selection")
    # print corrs


    # genRSAdistribution(exp, printData=True, plot=True, task="selection")


    # FRplot(exp, trials=trials, neurons=neurons)


    linearModel(exp)


    # tSNE(exp)


    # pcaProjection(exp, numComponents=25)



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

    for expType in ['attention', 'selection', 'combined']:
        expNum = 1
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
            

    testErrors = sorted(testErrors,key=lambda x: x[1])
    trainErrors = sorted(trainErrors,key=lambda x: x[1])

    ftrain = open("{}/Train_Errors".format(expRoot), "wb+")
    ftest = open("{}/Test_Errors".format(expRoot), "wb+")
    pprint(testErrors, stream=ftest)
    pprint(trainErrors, stream=ftrain)

if __name__ == "__main__":
    main()
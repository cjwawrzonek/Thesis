import random
import math
import os

import numpy as np
from pprint import pprint
import sys
from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN
import utility as util
import experiment as e
import matplotlib
# import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

def analysis(exp, save=True):
    raise Exception("Function not yet implemented.")

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

    print len(inputs)

    dThetas = []
    for trial in range(len(inputs)):
        j = np.asarray(inputs[trial])

        try:
            info = ast.literal_eval(ret['inputNames'][trial])
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

def main():
    matplotlib.interactive(True)

    ####################################################################################
    # For test computing the theta error of an experiment
    ####################################################################################

    expPath = "experiments/attention40/attention40.exp"
    exp = e.experiment()
    exp.read(expPath, W=True)
    exp.createTrainSet()

    thetas = thetaError(exp)
    fig = plt.figure()
    plt.hist(thetas, 45, normed=1, facecolor='green', alpha=0.75)
    # fig.show()
    plt.savefig("experiments/attention40/thetas.pdf", format="pdf")

    exit()

    ####################################################################################
    # For computing the trianing, testing, and theta errors of each experiment
    ####################################################################################
    testErrors = []
    trainErrors = []

    for expType in ['attention', 'selection', 'combined']:
        expNum = 1
        expPath = "experiments/{}{}/{}{}.exp".format(expType, expNum, expType, expNum)

        while (os.path.exists(expPath)):
            try:
                exp = e.experiment()
                exp.read(expPath, W=True)
                if exp.exp['train_pct'] < 100:
                    testErrors.append(["{}{}".format(expType, expNum), exp.testError()])
                    fthetas = open("experiments/{}{}/Theta_Errors".format(expType, expNum), "wb+")
                    thetas = thetaError(exp)
                    pprint(thetas, stream=fthetas)
                    fig = plt.figure()
                    plt.hist(thetas, 45, normed=1, facecolor='green', alpha=0.75)
                    # fig.show()
                    plt.savefig("experiments/{}{}/thetas.pdf".format(expType, expNum), format="pdf")
                    # plt.show(block=True)
                trainErrors.append(["{}{}".format(expType, expNum), exp.trainError()])
            except:
                pass
            expNum += 1
            expPath = "experiments/{}{}/{}{}.exp".format(expType, expNum, expType, expNum)
            print expPath

    testErrors = sorted(testErrors,key=lambda x: x[1])
    trainErrors = sorted(trainErrors,key=lambda x: x[1])

    ftrain = open("Train_Errors", "wb+")
    ftest = open("Test_Errors", "wb+")
    pprint(testErrors, stream=ftest)
    pprint(trainErrors, stream=ftrain)

if __name__ == "__main__":
    main()
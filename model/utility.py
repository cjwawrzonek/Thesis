##########################################################################################
# Utility functions library for repeated code
##########################################################################################
import ast
import copy
import pickle
import random
import math
import sys

import numpy as np

from pprint import pprint
from scipy.special import expit

# # Non-normalized (ie max of 1 at mean)
# def gaussian(x, mu, sig):
#     return np.exp(-np.power(x - mu, 2.) / (2 * np.power(sig, 2.)))

# # Normalied (ie sum over whole distribution = 1)
def gaussian(x, mu, sig):
    return 1./(math.sqrt(2.*math.pi)*sig)*np.exp(-np.power((x - mu)/sig, 2.)/2)

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

########################################################
# Reads in a set of inputs and targets from a file
#
# argumetns:
# filePath - file path with inputs and targets 
#   to read starting from directory of utility.py
# returns - dictionary with inputs and outputs
########################################################
def readTrials(filePath):

    # Read the inputs and targets
    #############################################
    fstim = open(filePath, 'rb')

    #for fixed training
    # fstim = open("DSTrainFixed.txt", 'rb')

    # swallow everything in memory
    block = fstim.read()
    lines = block.split("\n")
    fstim.close()
    # free our in-core file copy asap
    del block

    #First, set a line index for reading in the input
    lineNum = 0
    trial_time = 0
    inputNames = []
    targetNames = []
    inputs = []
    targets = []

    while lineNum < len(lines):
        trial = []
        line = lines[lineNum]
        lineNum += 1
        if line == '\n' or line == '':
            break
        try:
            title = ast.literal_eval(line)
            assert(title['type'] == 'input')
        except:
            print "Using old input / output labels"
        inputNames.append(line)
        line = lines[lineNum]
        lineNum += 1

        while line != "end":
            row = np.array(line.split(' '))
            data = row.astype(np.float32)
            trial.append(data)
            line = lines[lineNum]
            lineNum += 1

        inputs.append(trial)

        trial = []
        line = lines[lineNum]
        lineNum += 1
        try:
            title = ast.literal_eval(line)
            assert(title['type'] == 'output')
        except:
            print "Using old input / output labels"
        targetNames.append(line)

        line = lines[lineNum]
        lineNum += 1

        while line != "end":
            row = np.array(line.split(' '))
            if row[-1] == "":
                row = row[0:-1]
            data = row.astype(np.float32)
            trial.append(data)
            line = lines[lineNum]
            lineNum += 1      

        targets.append(trial)

    inputs = np.asarray(inputs)
    targets = np.asarray(targets)

    ret = {"inputs": inputs, "targets": targets,
           "inputNames": inputNames, "targetNames": targetNames,
           "trial_time": trial_time}
    return ret

####################################################
# Reads in a set of weights from a trained model
#
# argumetns:
# wFilePath - file with inputs and targets to read
# returns - dictionary with W and it's hyper params
####################################################
def readW(wFilePath):
    W = []
    wfile = open(wFilePath)

    line = wfile.readline()
    line = line.replace("[", "")
    line = line.replace("]", "")
    line = line.replace("\n", "")
    line = line.split(",")
    lay = [float(x) for x in line]

    line = wfile.readline()
    while line != "":
        num = float(line)
        W.append(num)
        line = wfile.readline()

    W = np.asarray(W)

    ret = {"W": W, "layers": lay}
    return ret

####################################################
# Writes the weight matrix for a trial to a file path
#
# argumetns:
# layers - the layer sizes to be saved with W
# W - the W matrix
# wFilePath - file with inputs and targets to read
####################################################
def writeW(layers, W, wFilePath):
    Wfile = open(wFilePath, "wb+")

    Wfile.write(str(layers))
    Wfile.write("\n")
    for i in range(len(W)):
        Wfile.write(str(W[i]))
        Wfile.write("\n")

####################################################
# Writes trial data to data file (for testing/training)
#
# argumetns:
# inSet - dictionary with inputs
# outSet - dictionary with outputs
# filePath - file path to write data
####################################################
def writeTrials(inSet, outSet, filePath, shuffle=False):
    f = open(filePath, "wb+")

    if (len(inSet) != len(outSet)):
        raise NameError("Erorr: Input and Output length are not equal.")
    indexes = range(len(inSet))
    if shuffle:
        random.shuffle(indexes)

    ####################################################################
    # Write the output to the output file
    ####################################################################
    for i in indexes:

        ###################################################
        # First, write the inputs
        ###################################################
        f.write(str(inSet[i]['title']))
        f.write('\n')

        for line in inSet[i]['inputs']:
            for k in range(len(line)-1):
                f.write(str(line[k]) + ' ')
            f.write(str(line[-1]))
            f.write('\n')

        f.write('end\n')

        ######################################################
        # Now write the targets
        ######################################################
        f.write(str(outSet[i]['title']))
        f.write('\n')

        for line in outSet[i]['outputs']:
            for k in range(len(line)-1):
                f.write(str(line[k]) + ' ')
            f.write(str(line[-1]))
            f.write('\n')

        f.write('end\n')

    f.close()

def isYes(question, default="yes"):
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

def isTrue(string):
    valid = ["true", "TRUE", "T", "t", "True", "Skywalker"]
    if string in valid:
        return True
    else:
        return False

def mean2(x):
    y = np.sum(x) / np.size(x);
    return y

def corr2(a,b):
    a = a - mean2(a)
    b = b - mean2(b)

    r = (a*b).sum() / math.sqrt((a*a).sum() * (b*b).sum())
    return r

def corr2_coeff(A,B):
    # Rowwise mean of input arrays & subtract from input arrays themeselves
    A_mA = A - A.mean(1)[:,None]
    B_mB = B - B.mean(1)[:,None]

    # Sum of squares across rows
    ssA = (A_mA**2).sum(1);
    ssB = (B_mB**2).sum(1);

    # Finally get corr coeff
    return np.dot(A_mA,B_mB.T)/np.sqrt(np.dot(ssA[:,None],ssB[None]))

def zscore(dataSet):
    sd = np.std(dataSet)
    dataMean = np.mean(dataSet)
    zs = []

    for x in dataSet:
        zs.append((x - dataMean)/sd)

    return zs

def q(x, *args):
    rnn = args[0]

    in_0 = args[1]
    rec_0 = x

    # offset = rnn.layers[0]
    # in_0 = x[0:offset]
    # rec_0 = x[offset:]

    rec_1 = activate(rnn, in_0, rec_0)

    dX = rec_1 - rec_0

    norm = np.linalg.norm(dX)
    return 0.5*(norm)*(norm)

def dExpit(x):
    num = np.exp(x)
    den = (1+np.exp(x))*(1+np.exp(x))

    return num/den

def getJacobian(x, *args):
    rnn = args[0]
    W, b = rnn.get_layer(rnn.W, 1)

    in_0 = args[1]

    jacobian=[]

    for i in range(len(W)):
        row = []
        for j in range(len(W)):
            if i == j:
                d = 1
            else:
                d = 0
            row.append(-d + W[i][j]*dExpit(x[j]))
        jacobian.append(row)

    return np.asarray(jacobian)

def getGaussNewton(x, *args):
    rnn = args[0]
    W, b = rnn.get_layer(rnn.W, 1)

    in_0 = args[1]

    gn = []
    jac = getJacobian(x, rnn, in_0)

    for i in range(len(W)):
        row = []
        for j in range(len(W)):
            val = 0
            for k in range(len(W)):
                val += jac[k][i]*jac[k][j]
            row.append(val)
        gn.append(row)

    print np.asarray(gn).shape
    exit()
    return np.asarray(gn)

def activate(rnn, in_0, rec_0, bias=False, return_out=False):
    W = rnn.W

    # We're throwing away the b_rec.
    # That can be added on a trial by trial basis.
    W_in, b_in = rnn.get_layer(W, 0)
    W_rec, b_rec = rnn.get_layer(W, 1)
    W_out, b_out = rnn.get_layer(W, 2)

    # recurrent activations
    ff_input = np.dot(in_0, W_in) + b_in

    if bias:
        rec_input = np.dot(rec_0, W_rec) + b_rec
    else:
        rec_input = np.dot(rec_0, W_rec) + b_rec

    rec_1 = expit(ff_input + rec_input)

    # # output activations
    # # we don't care about these when finding slow point
    if return_out:
        out_1 = expit(np.dot(rec_1, W_out) + b_out)
        return out_1

    # assume input doesn't change from previous step
    return rec_1


def main():
    x = [1, .9, .8, 1]

    print dExpit(x)
    exit()

if __name__ == "__main__":
    main()
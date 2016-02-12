##########################################################################################
# Utility functions library for repeated code
##########################################################################################
import ast
import copy
import pickle
import random
import math
import statistics as stat

import numpy as np
from pprint import pprint
import sys

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

##################################################
# Reads in a set of inputs and targets from a file
#
# argumetns:
# inputFile - file with inputs and targets to read
# returns - dictionary with inputs and outputs
##################################################
def readInputs(inputFile):

    # Read the inputs and targets
    #############################################
    fstim = open(inputFile, 'rb')

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
def writeTrial(inSet, outSet, filePath, shuffle=False):
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

def zscore(dataSet):
    sd = stat.pstdev(dataSet)
    dataMean = np.mean(dataSet)
    zs = []

    for x in dataSet:
        zs.append((x - dataMean)/sd)

    return zs
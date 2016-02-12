###################################################################################
# This is the main wrapper for the model. This creates/loads the desired inputs
# and the rnn and trains it. All work is done through the saccade() function.
# Simply use ~python model.py and it should train normally.
###################################################################################

import pickle

import shutil
import numpy as np
import matplotlib.pyplot as plt
import sys
import os.path

from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN
import utility as util

def model(inputList, dataPath):
    # This indicates that this is the first time we are training.
    # After this, change to loading previous weights
    init_train = True

    for i in range(len(inputList)):

        ret = util.readInputs(inputList[i])

        inputs = ret['inputs']
        targets = ret['targets']
        inputNames = ret["inputNames"]
        targetNames = ret["targetNames"]

        default = True
        # These are your initial hidden_weights, created through the matlab script weights.m
        if default == True:
            weights = open("hidden_weights_default.txt", 'rb+')
            shutil.copyfile("hidden_weights_default.txt", "hidden_weights.txt")
            shutil.copyfile("hidden_mask_default.txt", "hidden_mask.txt")
        else:
            weights = open("hidden_weight.txt", 'rb+')
        line = weights.readline();
        num_lines = 0

        while line != "":
            num_lines += 1
            line = weights.readline()

        weights.close()

        rnn = HessianRNN(layers=[len(inputs[0][0]), num_lines - 1, len(targets[0][0])], struc_damping=0.5,
                     use_GPU=False, debug=False, loadW=False, dataPath=dataPath)

        np.set_printoptions(edgeitems = 10)

        if init_train:
            isSuccess = train_saccade(i, inputNames, targetNames,
                                      inputs, targets, rnn)
            if isSuccess != True:
                print "Error: Overfitting in batch run"
                return False
            print "Training Successful \(0_0)/"
            init_train = False
        else:
            print "Loading weights from last training"
            print "\n\n\n(0_0)\n\n\n"
            wPath = rnn.dataPath + "W"
            isSuccess = train_saccade(i, inputNames, targetNames,
                                      inputs, targets, rnn, load_weights=wPath)
            if isSuccess != True:
                print "Error: Overfitting in batch run"
                return False
            print "Training Successful \(0_0)/"

        # Indicate that we finished at least one training cycle and may now load old weights
        init_train = False

    return True

def train_saccade(cycle, input_types, target_types,
                  inputs, targets, rnn,
                  load_weights=None, random_training=False):

    test = (inputs, targets)
    # exit()

    print "Beginning Training"

    # stdout = sys.stdout
    # sys.stdout = out1

    # Main training happens here. CG_iter and max_epochs effect training, so these are parameters i fit by hand
    # lots of work to be done fitting these.
    success = rnn.run_batches(inputs, targets, CG_iter=100, batch_size=None,
                test=test, max_epochs=151, random_training=False,
                load_weights=load_weights, plotting=True)

    # sys.stdout = stdout
    print "Finished Training: Recording outputs"
    print
    index = 0

    training_out = open(rnn.dataPath + "output" + str(cycle) + ".cycle", 'wb+')

    for i, t in zip(inputs, targets):
        print >> training_out
        print >> training_out, "Trail Type: {}\n".format(input_types[index])
        index += 1
        print >> training_out, "Inputs\n"#, i
        # for x in range(len(i)):
        #     print >> training_out, dim_scale(i[x], int(np.sqrt(stim_dim - 2)))
        print >> training_out, dim_scale(i[4], int(np.sqrt(len(inputs[0][0]) - 2)))
        print >> training_out, i[4][-4:]
        print >> training_out
        print >> training_out, "Targets\n", t
        print >> training_out
        output = rnn.forward(i, rnn.W)[-1]
        for x in range(len(output)):
            for y in range(len(output[x][0])):
                if output[x][0][y] < 0.001:
                    output[x][0][y] = 0
        output = output[:, 0, :]

        print >> training_out, "Output\n", output#rnn.forward(i, rnn.W)[-1]

    training_out.close()

    return success

def dim_scale(array1D, new_dim):
    new_array = np.asarray([[0 for x in range(new_dim)] for y in range(new_dim)])
    for x in range(new_dim):
        for y in range(new_dim):
            new_array[x][y] = array1D[(x*new_dim) + y]

    return new_array

def is_default(question, default="yes"):
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

def main():
    if len(sys.argv) == 3 or len(sys.argv) == 2:
        inputList = [] # The sequential list of trianing files
        dataPath = sys.argv[1]

        if not dataPath.endswith('/'):
            dataPath += '/'

        if len(sys.argv) == 3:
            setList = sys.argv[2]
        else:
            setList = "TrainingSet.txt"

        fstim = open(dataPath + setList, 'rb')

        # swallow everything in memory
        block = fstim.read()
        lines = block.split("\n")
        fstim.close()

        # free our in-core file copy asap
        del block

        for line in range(0, len(lines)):
            if lines[line] != '' and lines[line] != '\n':
                inputList.append(dataPath + lines[line])

        ###########################################
        # Ruuuuuun that simulation baby
        isSuccess = model(inputList, dataPath)
        ###########################################

        ## Save whether it was a result or failure in a data file
        dataFile = setList + ".results"

        if os.path.isfile(dataPath + dataFile):
            fresults = open(dataPath + dataFile, 'r+b')

            # swallow everything in memory
            block = fresults.read()
            lines = block.split("\n")

            successes=int(lines[0].split('=')[1])
            failures=int(lines[1].split('=')[1])

            fresults.close()
        else:
            successes = 0
            failures = 0

        if isSuccess:
            successes+=1
        else:
            failures+=1

        fresults = open(dataPath + dataFile, 'wb')
        fresults.write("successes=" + str(successes) + '\n')
        fresults.write("failures=" + str(failures))

        fresults.close()

    else:
        print "Error: Incorrect Usage\n\nCorrect Usage - python model.py [folder of input files] [training file]"

if __name__ == "__main__":
    main()
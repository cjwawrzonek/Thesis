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

from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN

def saccade():

    default = is_default("Run the model with default inputs?", "yes")
        fixed = is_default("Train on fixed delay? Type 'N' to train on varied delay trials.")

    # first load the input file
    # for varied length trianing
    if default == True:
        if fixed == False:
            fstim = open("DelayedSaccadeTrain_retrained.txt", 'rb')
        else:
            fstim = open("DSTrainFixed.txt", 'rb')
    else:
        fstim = open("DelayedSaccadeTrain.txt", 'rb')

    #for fixed training
    # fstim = open("DSTrainFixed.txt", 'rb')

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
        print lines[index]
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

    out1 = open("output.variable", 'wb+')

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

    rnn = HessianRNN(layers=[stim_dim + 2, num_lines - 1, num_targets], struc_damping=0.5,
                 use_GPU=False, debug=False, loadW=True)

    np.set_printoptions(edgeitems = 100)

    test = (inputs, targets)
    # exit()

    print "Beginning Training"

    # stdout = sys.stdout
    # sys.stdout = out1

    # Main training happens here. CG_iter and max_epochs effect training, so these are parameters i fit by hand
    # lots of work to be done fitting these.
    rnn.run_batches(inputs, targets, CG_iter=100, batch_size=None,
                test=test, max_epochs=151,
                load_weights=None, plotting=True)

    # sys.stdout = stdout
    print "Finished Training: Recording outputs"
    print
    index = 0

    for i, t in zip(inputs, targets):
        print >> out1, "Trail Type: {}\n".format(input_types[index])
        index += 1
        print >> out1, "Inputs\n"#, i
        # for x in range(len(i)):
        #     print >> out1, dim_scale(i[x], int(np.sqrt(stim_dim - 2)))
        print >> out1, dim_scale(i[0], int(np.sqrt(stim_dim - 2)))
        print >> out1
        print >> out1, "Targets\n", t
        print >> out1
        output = rnn.forward(i, rnn.W)[-1]
        for x in range(len(output)):
            for y in range(len(output[x][0])):
                if output[x][0][y] < 0.001:
                    output[x][0][y] = 0
        output = output[:, 0, :]

        print >> out1, "Output\n", output#rnn.forward(i, rnn.W)[-1]

    out1.close()

    return

    # This is for varied delay testing. Once you train the network, you can load new testing patterns 
    # and save the performance to see how well the model generalizes
    # Right now, I have varied delay testing off

    print "Now Time for Testing..."

    fstim = open("DelayedSaccadeTest.txt", 'rb')
    # swallow everything in memory
    block = fstim.read()
    lines = block.split("\n")
    fstim.close()
    # free our in-core file copy asap
    del block

    total_inputs = int(lines[0])
    stim_len = int(lines[1])
    stim_dim = int(lines[2])
    max_delay = int(lines[3])
    resp_len = int(lines[4])
    num_targets = int(lines[5])

    trial_time = stim_len + max_delay + resp_len

    t_inputs = np.asarray([[[0 for k in range(stim_dim + 2)] \
        for j in range(trial_time)] \
        for l in range(total_inputs)], dtype=np.float32)

    t_targets = np.asarray([[[0 for k in range(num_targets)] \
        for j in range(trial_time)] \
        for l in range(total_inputs)], dtype=np.float32)

    input_types = np.asarray([0 for k in range(total_inputs)], dtype=np.dtype((str, 20)))
    target_types = np.asarray([0 for k in range(total_inputs)], dtype=np.dtype((str, 20)))

    index = 6
    for trial in range(total_inputs):
        #first, the input set
        print lines[index]
        input_types[trial] = lines[index]
        index += 1
        # pars = title.split("-")
        for temp in range(trial_time):
            row = np.array(lines[index].split(' '))
            data = row.astype(np.float32)
            index += 1
            t_inputs[trial][temp] = data

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
            t_targets[trial][temp] = data

        assert(lines[index] == 'end') # verify where we are
        index += 1

    out2 = open("ouput.variable.test", 'wb+')

    index = 0
    for i, t in zip(t_inputs, t_targets):
        print >> out2, "Trail Type: {}\n".format(input_types[index])
        index += 1
        print >> out2, "Inputs\n"#, i
        for x in range(len(i)):
            print >> out2, dim_scale(i[x], int(np.sqrt(stim_dim - 2)))
        print >> out2
        print >> out2, "Targets\n", t
        print >> out2
        output = rnn.forward(i, rnn.W)[-1]
        for x in range(len(output)):
            for y in range(len(output[x][0])):
                if output[x][0][y] < 0.001:
                    output[x][0][y] = 0
        output = output[:, 0, :]

        print >> out2, "Output\n", output#rnn.forward(i, rnn.W)[-1]

    out2.close()


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
    saccade()

if __name__ == "__main__":
    main()
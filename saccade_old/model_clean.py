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

def model():
    default = is_default("Run the model with default inputs?", "yes")
    fixed = is_default("Train on fixed delay? Type 'N' to train on varied delay trials.")
        
    # first load the input file
    # for varied length trianing
    if default == True:
        if fixed == False:
            fstim = open("DelayedSaccadeTrain_retrained.txt", 'rb')
        else:
            fstim = open("DSTrainFixed_Clean.txt", 'rb')
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

    #First, set a line index for reading in the input
    line_num = 0

    ## meta data on the inputs that I store at the top
    total_inputs = int(lines[line_num].split('=')[1]) # total number of input trials
    line_num += 1
    stim_len = int(lines[line_num].split('=')[1]) # length of stimulus during trial
    line_num += 1
    stim_dim = int(lines[line_num].split('=')[1]) # dimension of the stimulus
    line_num += 1
    max_delay = int(lines[line_num].split('=')[1]) # maximum amount of time the stimulus must delay (this varies)
    line_num += 1
    resp_len = int(lines[line_num].split('=')[1])  # length of response time
    line_num += 1
    num_targets = int(lines[line_num].split('=')[1]) # number of targets (12 by default)
    line_num += 1

    # This is the total length of one trial (input, delay, ouput)
    trial_time = stim_len + max_delay + resp_len

    inputs = np.asarray([[[0 for k in range(stim_dim + 2)] \
        for j in range(trial_time)] \
        for l in range(total_inputs)], dtype=np.float32)

    targets = np.asarray([[[0 for k in range(num_targets)] \
        for j in range(trial_time)] \
        for l in range(total_inputs)], dtype=np.float32)

    input_types = np.asarray([0 for k in range(total_inputs)], dtype=np.dtype((str, 20)))
    target_types = np.asarray([0 for k in range(total_inputs)], dtype=np.dtype((str, 20)))

    for trial in range(total_inputs):
        #first, the input set
        print lines[line_num]
        input_types[trial] = lines[line_num]
        line_num += 1
        # pars = title.split("-")
        for temp in range(trial_time):
            row = np.array(lines[line_num].split(' '))
            data = row.astype(np.float32)
            line_num += 1
            inputs[trial][temp] = data

        assert(lines[line_num] == 'end') # verify where we are
        line_num += 1

        #then the output set
        target_types[trial] = lines[line_num]
        line_num += 1
        for temp in range(trial_time):
            row = np.array(lines[line_num].split(' '))
            try:
                data = row[0:num_targets].astype(np.float32)
            except:
                print row
                exit()
            line_num += 1
            targets[trial][temp] = data

        assert(lines[line_num] == 'end') # verify where we are
        line_num += 1

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
                 use_GPU=False, debug=False, loadW=False)

    cycles = get_cycles(num_targets)

    np.set_printoptions(edgeitems = 10)
    init_train = True
    cycle_num = 1

    for num_inputs in cycles:
        # calculate the new inputs for this level
        step_size = int(num_targets / num_inputs)
        # print "step_size: " + str(step_size)
        # inputs_sub = []
        inputs_sub = np.empty([num_inputs, trial_time, stim_dim + 2], dtype=np.float32)
        targets_sub = np.empty([num_inputs, trial_time, num_targets], dtype=np.float32)

        input_types_sub = np.empty([num_inputs], dtype=np.dtype((str, 20)))
        target_types_sub = np.empty([num_inputs], dtype=np.dtype((str, 20)))

        i = 0
        while i < num_inputs:
            input_types_sub[i] = input_types[i*step_size]
            target_types_sub[i] = target_types[i*step_size]
            inputs_sub[i] = inputs[i*step_size]
            targets_sub[i] = targets[i*step_size]
            i += 1

        if init_train:
            isSuccess = train_saccade(cycle_num, input_types_sub, target_types_sub, inputs_sub, targets_sub, rnn)
            if isSuccess != True:
                print "Error: Overfitting in batch run"
                return
            init_train = False
        else:
            isSuccess = train_saccade(cycle_num, input_types_sub, target_types_sub, inputs_sub, targets_sub, rnn, load_weights="W")
            if isSuccess != True:
                print "Error: Overfitting in batch run"
                return

        cycle_num = cycle_num + 1


def train_saccade(cycle, input_types, target_types, inputs, targets, rnn, load_weights=None, random_training=False):

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

    training_out = open("output.cycle" + str(), 'wb+')

    for i, t in zip(inputs, targets):
        print >> training_out, "Trail Type: {}\n".format(input_types[index])
        index += 1
        print >> training_out, "Inputs\n"#, i
        # for x in range(len(i)):
        #     print >> training_out, dim_scale(i[x], int(np.sqrt(stim_dim - 2)))
        print >> training_out, dim_scale(i[0], int(np.sqrt(len(inputs[0][0]) - 2)))
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

    return success # CLEAN CODE BEFORE REMOVING

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

    testing_out = open("ouput.variable.test", 'wb+')

    index = 0
    for i, t in zip(t_inputs, t_targets):
        print >> testing_out, "Trail Type: {}\n".format(input_types[index])
        index += 1
        print >> testing_out, "Inputs\n"#, i
        for x in range(len(i)):
            print >> testing_out, dim_scale(i[x], int(np.sqrt(stim_dim - 2)))
        print >> testing_out
        print >> testing_out, "Targets\n", t
        print >> testing_out
        output = rnn.forward(i, rnn.W)[-1]
        for x in range(len(output)):
            for y in range(len(output[x][0])):
                if output[x][0][y] < 0.001:
                    output[x][0][y] = 0
        output = output[:, 0, :]

        print >> testing_out, "Output\n", output#rnn.forward(i, rnn.W)[-1]

    testing_out.close()


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

def get_cycles(num_targets):
    question = "How many training cycles do you want to run? Please input an integer. (Suggested: 4)\n"
    sys.stdout.write(question)

    while True:
        cycles = int(raw_input())
        if cycles > num_targets or cycles < 1:
            sys.stdout.write("Please respond with an integer between "
                                 "1 and 10.\n")
        else:
            break

    input_list = []

    for i in range(cycles):
        question = "Inputs for trial " + str(i) + ":\n"
        sys.stdout.write(question)
        message = "Please respond with an integer between "\
                                     "1 and " + str(num_targets) + ".\n"
        while True:
            inputs = raw_input()
            if inputs != "":
                inputs = int(inputs)
                if inputs > num_targets or inputs < 1:
                    sys.stdout.write(message)
                else:
                    break
            else:
                sys.stdout.write(message)
        input_list.append(inputs)

    return input_list

def main():
    model()

if __name__ == "__main__":
    main()
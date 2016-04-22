###################################################################################
# File for generating input Files for selection task
# i.e. number presented to determine which stimuli to attend to
###################################################################################

import ast
import sys
import random
import math

import utility as util # my standard library
import pprint as pp
import numpy as np

def createTargets(locations):
	spaces = []
	for i in range(locations):
		space_i = np.zeros(locations)
		space_i[i] = 1
		spaces.append(space_i)

	targets = []

	#now we have to generate the targets
	for i in range(locations):
		rads = (float(i) / float(locations)) * 2 * math.pi
		dx = math.cos(rads)
		dy = math.sin(rads)

		# store the deviation from the center in our two x coor variables
		if dx >= 0:
			dxPlus = dx
			dxMinus = 0
		else:
			dxPlus = 0
			dxMinus = abs(dx)

		if dy >= 0:
			dyPlus = dy
			dyMinus = 0
		else:
			dyPlus = 0
			dyMinus = abs(dy)

		targets.append([dxPlus, dxMinus, dyPlus, dyMinus])
		# print targets[-1]
		# space.printSpace(i)

	return targets, spaces

def inputGen(exp, test=False, shuffle=True):
	# phase_var is a dictionary of booleans. If a phase has variable delay, it is true. else false

	if exp.exp['type'] == "combined":
		tasks = ["selection", "attention"]
	elif exp.exp['type'] == "attention":
		tasks = ["attention"]
	elif exp.exp['type'] == "selection":
		tasks = ["selection"]
	else:
		raise Exception("Unkown exp type: {}".format(exp.exp['type']))

	locations = exp.exp["num_locs"]
	phase_var = exp.exp["phase_var"]
	train_pct = exp.exp["train_pct"]
	filepath = exp.exp['directory']
	ifile = exp.exp['train_file']

	phase_times = exp.exp['phase_times']

	selection_time = phase_times['cue']
	stim_time = phase_times['locs']
	delay_time = phase_times['delay']
	pause1 = phase_times['pause1']
	pause2 = phase_times['pause2']
	output_time = phase_times['output']

	# reps determines how thorough the training is
	#*
	reps = int(round((locations - 1) * (float(train_pct) / 100)))

	targets, spaces = createTargets(locations)

	# Create the output file name string
	if filepath is None:
		filepath = ifile
	elif not filepath.endswith('/'):
		finputs = filepath + '/' + ifile
	else:
		finputs = filepath + ifile

	#######################################################################
	# inputSet will be a 3 x num inputs dictionary as follows
	#
	# [ 'title': {dict}, 'input': input ]
	# [ 'title': 'input-[5.0,10.0]-Selection_target=1'], 'inputs': [[1, 0, 0, ... 0]] ]
	# ...
	# num trials
	# ...
	# [ [inputName], [input] ]
	#######################################################################
	inputSet = []
	unusedInSet = []

	#######################################################################
	# outSet will be a 2 x num inputs dictionary that looks like this:
	#
	# [ 'title': {dict}, 'dic': output1 ]
	# [ [title], [output2] ]
	# ...
	# num trials
	# ...
	# [ [title], [outputN] ]
	#######################################################################
	outSet = []
	unusedOutSet = []

	#*
	unused_pairs = [x for x in range(locations)]
	for x in range(locations):
		unused_pairs[x] = [[],[]]

	##################################################################
	# This big loops generates all of the inputs and targets. Each iteration
	# of the innermost loop creates one trial of input and output and stores
	# them in two sets, inputSet and outputSet. After they are created,
	# they are potentially shuffled and written to an input file
	##################################################################
	for task in tasks:
		for i in range(locations):
			for selection in range(2):
				unusedLocations = range(locations)
				unusedLocations.remove(i)
				for repititions in range(reps):

					##############################################
					# The input for this trial, i
					# range(i) = selection*repititions*locations
					input_i = []

					# The output for this trial, i
					output_i = []
					##############################################

					trialSet = {}

					out_len = output_time
					inputVector = spaces[i]

					if len(unusedLocations) > 0:
						index = random.randint(0, len(unusedLocations)-1)
						falseCue = unusedLocations[index]
						unusedLocations.remove(falseCue)
					else:
						falseCue = random.randint(0, locations-1)
					falseInputVector = spaces[falseCue]

					# Crete the label for this trial with all the necessary information
					title = {'type':'input', 'task':task, 'inputs':{},
							 'timing': {'selection': selection_time,
							 			'cue1': stim_time,
							 			'cue2': stim_time,
							 			'pause1': pause1,
							 			'pause2': pause2,
							 			'delay': delay_time,
							 			'output': out_len}}
					if (selection == 0):
						title['inputs']['cue1'] = i
						title['inputs']['cue2'] = falseCue
						title['inputs']['choice'] = 1
					else:
						title['inputs']['cue1'] = falseCue
						title['inputs']['cue2'] = i
						title['inputs']['choice'] = 2

					trialSet['title'] = title

					####################################################################
					# phase 1: If attention, selection param. if selection, loc1
					####################################################################
					if task == "attention":
						for j in range(selection_time):
							inputLine = []
							for k in range(locations):
								inputLine.append(0)
							# present fixation point
							inputLine.append(1)
							inputLine.append(0)
							# choose selection target
							if selection == 0:
								inputLine.append(1)
								inputLine.append(0)
							elif selection == 1:
								inputLine.append(0)
								inputLine.append(1)
							else:
								raise NameError('Incorrect selection num when generating inputs.')
							input_i.append(inputLine)
					elif task == "selection":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the next target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)

					######################################################################
					# phase 2: a brief pause with no input
					######################################################################

					for j in range(pause1):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					####################################################################
					# phase 3: If attention, loc1. if selection, loc2
					####################################################################

					if task == "attention":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the first target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)
					elif task == "selection":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the next target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)

					######################################################################
					# phase 4: a brief pause with no input
					######################################################################

					for j in range(pause2):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					####################################################################
					# phase 5: If attention, loc2. if selection, selection param
					####################################################################
					if task == "selection":
						for j in range(selection_time):
							inputLine = []
							for k in range(locations):
								inputLine.append(0)
							# present fixation point
							inputLine.append(1)
							inputLine.append(0)
							# choose selection target
							if selection == 0:
								inputLine.append(1)
								inputLine.append(0)
							elif selection == 1:
								inputLine.append(0)
								inputLine.append(1)
							else:
								raise NameError('Incorrect selection num when generating inputs.')
							input_i.append(inputLine)
					elif task == "attention":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the next target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)

					####################################################################
					# phase 6: the delay period
					####################################################################

					for j in range(delay_time):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					####################################################################
					# phase 7: stimulus presentation
					####################################################################

					for j in range(out_len):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					trialSet['inputs'] = input_i
					inputSet.append(trialSet)

					################################################################
					# Now create the targets
					################################################################
					trialSet = {} # reset the trial set

					# Crete the label for this trial with all the necessary information
					title = {'type': 'output',
							 'task': task,
							 'inputs': {},
							 'timing': {'selection': selection_time,
							 			'cue1': stim_time,
							 			'cue2': stim_time,
							 			'pause1': pause1,
							 			'pause2': pause2,
							 			'delay': delay_time,
							 			'output': out_len}}
					if (selection == 0):
						title['inputs']['cue1'] = i
						title['inputs']['cue2'] = falseCue
						title['inputs']['choice'] = 1
					else:
						title['inputs']['cue1'] = falseCue
						title['inputs']['cue2'] = i
						title['inputs']['choice'] = 2

					trialSet['title'] = title

					################################################################
					# phase 1 -> 6: stim1 + stim2 + selection + pause1 + pause2
					################################################################
					latent_time = selection_time + (2*stim_time) + \
								  pause1 + pause2 + delay_time
					for j in range(latent_time):
						outputLine = []
						outputLine.append(0)
						outputLine.append(0)
						outputLine.append(0)
						outputLine.append(0)
						output_i.append(outputLine)

					############################################################
					# and finally, the correct output
					############################################################
					for j in range(out_len):
						outputLine = []
						for k in range(len(targets[i])):
							outputLine.append(targets[i][k])
						output_i.append(outputLine)

					trialSet['outputs'] = output_i
					outSet.append(trialSet)
				
				unused_pairs[i][selection].append(unusedLocations)

				for loc in unusedLocations:

					##############################################
					# The input for this trial, i
					# range(i) = selection*repititions*locations
					input_i = []

					# The output for this trial, i
					output_i = []
					##############################################

					trialSet = {}

					out_len = output_time
					inputVector = spaces[i]

					falseCue = loc
					falseInputVector = spaces[falseCue]

					# Crete the label for this trial with all the necessary information
					title = {'type':'input', 'task':task, 'inputs':{},
							 'timing': {'selection': selection_time,
							 			'cue1': stim_time,
							 			'cue2': stim_time,
							 			'pause1': pause1,
							 			'pause2': pause2,
							 			'delay': delay_time,
							 			'output': out_len}}
					if (selection == 0):
						title['inputs']['cue1'] = i
						title['inputs']['cue2'] = falseCue
						title['inputs']['choice'] = 1
					else:
						title['inputs']['cue1'] = falseCue
						title['inputs']['cue2'] = i
						title['inputs']['choice'] = 2

					trialSet['title'] = title

					####################################################################
					# phase 1: If attention, selection param. if selection, loc1
					####################################################################
					if task == "attention":
						for j in range(selection_time):
							inputLine = []
							for k in range(locations):
								inputLine.append(0)
							# present fixation point
							inputLine.append(1)
							inputLine.append(0)
							# choose selection target
							if selection == 0:
								inputLine.append(1)
								inputLine.append(0)
							elif selection == 1:
								inputLine.append(0)
								inputLine.append(1)
							else:
								raise NameError('Incorrect selection num when generating inputs.')
							input_i.append(inputLine)
					elif task == "selection":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the next target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)

					######################################################################
					# phase 2: a brief pause with no input
					######################################################################

					for j in range(pause1):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					####################################################################
					# phase 3: If attention, loc1. if selection, loc2
					####################################################################

					if task == "attention":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the first target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)
					elif task == "selection":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the next target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)

					######################################################################
					# phase 4: a brief pause with no input
					######################################################################

					for j in range(pause2):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					####################################################################
					# phase 5: If attention, loc2. if selection, selection param
					####################################################################
					if task == "selection":
						for j in range(selection_time):
							inputLine = []
							for k in range(locations):
								inputLine.append(0)
							# present fixation point
							inputLine.append(1)
							inputLine.append(0)
							# choose selection target
							if selection == 0:
								inputLine.append(1)
								inputLine.append(0)
							elif selection == 1:
								inputLine.append(0)
								inputLine.append(1)
							else:
								raise NameError('Incorrect selection num when generating inputs.')
							input_i.append(inputLine)
					elif task == "attention":
						if selection == 0:
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(falseInputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)		
						else: # selecting the next target
							for j in range(stim_time):
								inputLine = []
								for k in range(len(inputVector)):
									inputLine.append(inputVector[k])
								inputLine.append(1)
								inputLine.append(0)
								inputLine.append(0)
								inputLine.append(0)
								input_i.append(inputLine)

					####################################################################
					# phase 6: the delay period
					####################################################################

					for j in range(delay_time):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					####################################################################
					# phase 7: stimulus presentation
					####################################################################

					for j in range(out_len):
						inputLine = []
						for k in range(len(inputVector)):
							inputLine.append(0)
						inputLine.append(0)
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

					trialSet['inputs'] = input_i
					unusedInSet.append(trialSet)

					################################################################
					# Now create the targets
					################################################################
					trialSet = {} # reset the trial set

					# Crete the label for this trial with all the necessary information
					title = {'type': 'output',
							 'task': task,
							 'inputs': {},
							 'timing': {'selection': selection_time,
							 			'cue1': stim_time,
							 			'cue2': stim_time,
							 			'pause1': pause1,
							 			'pause2': pause2,
							 			'delay': delay_time,
							 			'output': out_len}}
					if (selection == 0):
						title['inputs']['cue1'] = i
						title['inputs']['cue2'] = falseCue
						title['inputs']['choice'] = 1
					else:
						title['inputs']['cue1'] = falseCue
						title['inputs']['cue2'] = i
						title['inputs']['choice'] = 2

					trialSet['title'] = title

					################################################################
					# phase 1 -> 6: stim1 + stim2 + selection + pause1 + pause2
					################################################################
					latent_time = selection_time + (2*stim_time) + \
								  pause1 + pause2 + delay_time
					for j in range(latent_time):
						outputLine = []
						outputLine.append(0)
						outputLine.append(0)
						outputLine.append(0)
						outputLine.append(0)
						output_i.append(outputLine)

					############################################################
					# and finally, the correct output
					############################################################
					for j in range(out_len):
						outputLine = []
						for k in range(len(targets[i])):
							outputLine.append(targets[i][k])
						output_i.append(outputLine)

					trialSet['outputs'] = output_i
					unusedOutSet.append(trialSet)

	funused = open(finputs + "_UnusedLocations", "wb+")
	pp.pprint(unused_pairs, funused)
	funused.close()

	if filepath.endswith("/"):
		unusedFile = filepath + "Unused_Locs.train"
	else:
		unusedFile = filepath + "/" + "Unused_Locs.train"

	util.writeTrials(unusedInSet, unusedOutSet, unusedFile, shuffle=True)
	util.writeTrials(inputSet, outSet, finputs, shuffle=shuffle)


def main():

	raise Exception("Error: This main method is deprecated for now.")

if __name__ == "__main__":
    main()
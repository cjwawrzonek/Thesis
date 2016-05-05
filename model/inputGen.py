###################################################################################
# File for generating input Files for selection task
# i.e. number presented to determine which stimuli to attend to
###################################################################################

import ast
import sys
import inputSpaces as ips
import random
import utility as util # my standard library
import pprint as pp

def createTargets(n, locations):
	space = ips.inputSpace(n)
	space.createInputs(locations)
	targets = []

	center = int(round(n / 2))

	#now we have to generate the targets
	for i in range(locations):
		coor = space.getCoor(i)
		dx = (coor[1] - center) / center
		dy = (coor[0] - center) / center

		# store the deviation from the center in our two x coor variables
		if dx >= 0:
			dxPlus = dx
			dxMinus = 0
		else:
			dxPlus = 0
			dxMinus = abs(dx)

		if dy >= 0:
			dyPlus = 0
			dyMinus = dy
		else:
			dyPlus = abs(dy)
			dyMinus = 0

		targets.append([dxPlus, dxMinus, dyPlus, dyMinus])
		# print targets[-1]
		# space.printSpace(i)

	return {"targets": targets, "space": space}

def attenGen(n, locations, phase_times, phase_var, train_pct, ifile, filepath=None, test=False, shuffle=True):
	# phase_var is a dictionary of booleans. If a phase has variable delay, it is true. else false

	selection_time = phase_times['cue']
	stim_time = phase_times['locs']
	delay_time = phase_times['delay']
	output_time = phase_times['output']

	# reps determines how thorough the training is
	#*
	reps = int(round((locations - 1) * (float(train_pct) / 100)))

	ret = createTargets(n, locations)
	targets = ret['targets']
	space = ret['space']

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
				inputGrid = space.getInputGrid(i)

				if len(unusedLocations) > 0:
					index = random.randint(0, len(unusedLocations)-1)
					falseCue = unusedLocations[index]
					unusedLocations.remove(falseCue)
				else:
					falseCue = random.randint(0, locations-1)
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###########################################
				# first, create the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# now, the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				# chose not to present the selection param during delay... unsure
				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first, the selection presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
				for j in range(out_len):
					outputLine = []
					for k in range(len(targets[i])):
						outputLine.append(targets[i][k])
					output_i.append(outputLine)

				trialSet['outputs'] = output_i
				outSet.append(trialSet)
			#*
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
				inputGrid = space.getInputGrid(i)

				falseCue = loc
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###########################################
				# first, create the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# now, the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				# chose not to present the selection param during delay... unsure
				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first, the selection presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
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

def selGen(n, locations, phase_times, phase_var, train_pct, ifile, test=False, shuffle=True, filepath=None):
	# phase_var is a dictionary of booleans. If a phase has variable delay, it is true. else false

	selection_time = phase_times['cue']
	stim_time = phase_times['locs']
	delay_time = phase_times['delay']
	output_time = phase_times['output']

	# reps determines how thorough the training is
	#*
	reps = int(round((locations - 1) * (float(train_pct) / 100)))

	ret = createTargets(n, locations)
	targets = ret['targets']
	space = ret['space']

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
				inputGrid = space.getInputGrid(i)

				if len(unusedLocations) > 0:
					index = random.randint(0, len(unusedLocations)-1)
					falseCue = unusedLocations[index]
					unusedLocations.remove(falseCue)
				else:
					falseCue = random.randint(0, locations-1)
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###################################
				# the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###########################################
				# then, the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then, the cue presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
				for j in range(out_len):
					outputLine = []
					for k in range(len(targets[i])):
						outputLine.append(targets[i][k])
					output_i.append(outputLine)

				trialSet['outputs'] = output_i
				outSet.append(trialSet)
			#*
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
				inputGrid = space.getInputGrid(i)

				falseCue = loc
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###################################
				# the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###########################################
				# then, the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then, the cue presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
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

def combGen(n, locations, phase_times, phase_var, train_pct, ifile, test=False, shuffle=True, filepath=None):
	# phase_var is a dictionary of booleans. If a phase has variable delay, it is true. else false

	selection_time = phase_times['cue']
	stim_time = phase_times['locs']
	delay_time = phase_times['delay']
	output_time = phase_times['output']

	# reps determines how thorough the training is
	#*
	reps = int(round((locations - 1) * (float(train_pct) / 100)))

	ret = createTargets(n, locations)
	targets = ret['targets']
	space = ret['space']

	# Create the output file name string
	if filepath is None:
		filepath = ifile
	elif not filepath.endswith('/'):
		finputs = filepath + '/' + ifile
	else:
		finputs = filepath + ifile

	inputSet = []
	unusedInSet = []

	outSet = []
	unusedOutSet = []

	#*
	unused_pairs = [x for x in range(locations)]
	for x in range(locations):
		unused_pairs[x] = [[],[]]

	##################################################################
	# First big loop to make the selection inputs
	##################################################################
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
				inputGrid = space.getInputGrid(i)

				if len(unusedLocations) > 0:
					index = random.randint(0, len(unusedLocations)-1)
					falseCue = unusedLocations[index]
					unusedLocations.remove(falseCue)
				else:
					falseCue = random.randint(0, locations-1)
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###################################
				# the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###########################################
				# then, the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then, the cue presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
				for j in range(out_len):
					outputLine = []
					for k in range(len(targets[i])):
						outputLine.append(targets[i][k])
					output_i.append(outputLine)

				trialSet['outputs'] = output_i
				outSet.append(trialSet)
			#*
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
				inputGrid = space.getInputGrid(i)

				falseCue = loc
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###################################
				# the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###########################################
				# then, the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'selection'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then, the cue presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
				for j in range(out_len):
					outputLine = []
					for k in range(len(targets[i])):
						outputLine.append(targets[i][k])
					output_i.append(outputLine)

				trialSet['outputs'] = output_i
				unusedOutSet.append(trialSet)

	#*
	funused = open(finputs + "_UnusedSelection", "wb+")
	pp.pprint(unused_pairs, funused)
	funused.close()

	unused_pairs = [x for x in range(locations)]
	for x in range(locations):
		unused_pairs[x] = [[],[]]

	#################################################
	# Second big loop to generate attention inputs
	#################################################

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
				inputGrid = space.getInputGrid(i)

				if len(unusedLocations) > 0:
					index = random.randint(0, len(unusedLocations)-1)
					falseCue = unusedLocations[index]
					unusedLocations.remove(falseCue)
				else:
					falseCue = random.randint(0, locations-1)
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###########################################
				# first, create the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# now, the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				# chose not to present the selection param during delay... unsure
				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first, the selection presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
				for j in range(out_len):
					outputLine = []
					for k in range(len(targets[i])):
						outputLine.append(targets[i][k])
					output_i.append(outputLine)

				trialSet['outputs'] = output_i
				outSet.append(trialSet)
			#*
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
				inputGrid = space.getInputGrid(i)

				falseCue = loc
				falseInputGrid = space.getInputGrid(falseCue)

				# Crete the label for this trial with all the necessary information
				title = {}
				title['type'] = 'input'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				###########################################
				# first, create the cue presentation
				###########################################
				for j in range(selection_time):
					inputLine = []
					for k in range(n):
						for q in range(n):
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

				###################################
				# now, the first stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				###################################
				# now, the second stim presentation
				###################################
				if selection == 0:
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(falseInputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)		
				else: # selecting the next target
					for j in range(stim_time):
						inputLine = []
						for k in range(n):
							for q in range(n):
								inputLine.append(inputGrid[k][q])
						inputLine.append(1)
						inputLine.append(0)
						inputLine.append(0)
						inputLine.append(0)
						input_i.append(inputLine)

				# chose not to present the selection param during delay... unsure
				###################################
				# the delay period
				###################################
				for j in range(delay_time):
					inputLine = []
					for k in range(n*n):
						inputLine.append(0)
					inputLine.append(1)
					inputLine.append(0)
					inputLine.append(0)
					inputLine.append(0)
					input_i.append(inputLine)

				###################################
				# then nothing during the output phase
				###################################
				for j in range(out_len):
					inputLine = []
					for k in range(n*n):
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
				title = {}
				title['type'] = 'output'
				title['task'] = 'attention'
				title['inputs'] = {}
				if (selection == 0):
					title['inputs']['cue1'] = i
					title['inputs']['cue2'] = falseCue
					title['inputs']['choice'] = 1
				else:
					title['inputs']['cue1'] = falseCue
					title['inputs']['cue2'] = i
					title['inputs']['choice'] = 2
				title['timing'] = {}
				title['timing']['selection'] = selection_time
				title['timing']['cue1'] = stim_time
				title['timing']['cue2'] = stim_time
				title['timing']['delay'] = delay_time
				title['timing']['output'] = out_len

				trialSet['title'] = title

				####################################
				# first, the selection presentation
				####################################
				for j in range(selection_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then for both stim presentations
				####################################
				for j in range(2*stim_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# then the delay period
				####################################
				for j in range(delay_time):
					outputLine = []
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					outputLine.append(0)
					output_i.append(outputLine)

				####################################
				# and finally, the correct input stim
				####################################
				for j in range(out_len):
					outputLine = []
					for k in range(len(targets[i])):
						outputLine.append(targets[i][k])
					output_i.append(outputLine)

				trialSet['outputs'] = output_i
				unusedOutSet.append(trialSet)

	funused = open(finputs + "_UnusedAttention", "wb+")
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
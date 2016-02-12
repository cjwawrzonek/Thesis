###################################################################################
# File for generating input Files for selection task
# i.e. number presented to determine which stimuli to attend to
###################################################################################

import ast
import sys
import inputSpaces as ips
import random
import utility as util # my standard library

def attenGen(n, locations, phase_times, phase_var, test=False, shuffle=False, filepath=None):
	# phase_var is a dictionary of booleans. If a phase has variable delay, it is true. else false

	selection_time = phase_times['cue']
	stim_time = phase_times['locs']
	delay_time = phase_times['delay']
	output_time = phase_times['output']


	reps = locations - 1
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

	# Create the output file name string
	if filepath is None:
		fname = ""
		if test:
			fname += "TEST"
		fname += "attention_" + str(n) + "x" + str(n) + "_" + str(locations) + \
				 "_targets_"
		if shuffle:
			fname+= "shuffle"
		if rand_delay or rand_input:
			fname += "_randDelay"
		fname += ".txt"
	else:
		fname = filepath

	#######################################################################
	# The number of inputs will be 2x locations. We will start each target
	# first once and choose it, and second once and choose it.
	#######################################################################

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
				# first, create the selection presentation
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
						inputLine.append(1)
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
						inputLine.append(1)
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
						inputLine.append(1)
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
						inputLine.append(1)
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

	# END FIRST BIG LOOP

	util.writeTrial(inputSet, outSet, fname, shuffle=shuffle)

def main():
	print "Error: This main method is deprecated for now."
	raise Exception()

	default = util.isYes("Use default trial parameters?", "yes")

	if default:
		n = 11
		locations = 8
		selection_time = 3
		stim_time = 5
		delay_time = 5
		output_time = 5
		rand_input = False
		rand_delay = False
		test = True
		shuffle = True
		reps = 7
		fname = None
	else:
		fname = raw_input("What should this file be named?\n")
		test = util.isYes("Is this for testing purposes? (as opposed to training)\n")
		shuffle = util.isYes("Shuffle the input sequence?\n")
		n = int(raw_input("What is the side length (n) of the 2D input space? (Odd numbers only)\n"))
		locations = int(raw_input("How many targets should there be?\n"))
		selection_time = int(raw_input("How long should the selection time be?\n"))
		stim_time = int(raw_input("How long should the stimulus presentation be?\n"))
		delay_time = int(raw_input("How long should the delay period be?\n"))
		output_time = int(raw_input("How long should the output presentation be?\n"))
		max_trial = stim_time + delay_time + output_time
		rand_input = util.isYes("Should there be randomized input periods?\n")
		if rand_input:
			input_var = int(raw_input("What is the range of input variability in time steps? (Ex: 2 would mean stimulus +- 2 steps)\n"))
			max_trial += input_var
		rand_delay = util.isYes("Should there be randomized delay periods?\n")
		if rand_delay:
			delay_var = int(raw_input("What is the range of delay variability in time steps? (Ex: 2 would mean delay +- 2 steps)\n"))
			max_trial += delay_var

	if rand_delay or rand_input:
		rand = random.seed()
		reps = int(raw_input("Finally, what are the number of repetitions of random length?\n"))

	attenGen(n=n, locations=locations, stim_time=stim_time,
			 delay_time=delay_time, output_time=output_time,
			 rand_input=rand_input, rand_delay=rand_delay, test=test,
			 selection_time=selection_time, reps=reps, shuffle=shuffle,
			 fname=fname)

if __name__ == "__main__":
    main()
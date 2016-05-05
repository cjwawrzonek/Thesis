###################################################################################
# File for generating input Files of basic type, input -> output with delay
###################################################################################

import sys
import inputSpaces as ips
import random

def inputGen(n, num_inputs, stim_time, delay_time, output_time,
			 rand_input, rand_delay, test, reps, input_var, delay_var):
	space = ips.inputSpace(n)
	space.createInputs(num_inputs)
	targets = []

	center = int(round(n / 2))

	#now we have to generate the tarets
	for i in range(num_inputs):
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
	fname = ""

	if test:
		fname += "TEST"

	fname += "Inputs_" + str(n) + "x" + str(n) + "_" + str(num_inputs)

	if rand_delay or rand_input:
		fname += "_targetsRAND.txt"
	else:
		fname += "_targetsNoRAND.txt"
	f = open(fname, "wb+")

	## Now write out the information to the file
	for i in range(num_inputs):
		for repititions in range(reps):
			out_len = output_time
			inputGrid = space.getInputGrid(i)

			f.write('input-' + str(space.getCoor(i)).replace(' ', ''))
			f.write('\n')

			# first, the stim presentation
			if rand_input:
				stim = random.randint(stim_time - input_var, stim_time + input_var)
				out_len += (stim_time - stim)
				for j in range(stim):
					for k in range(n):
						for q in range(n):
							f.write(str(inputGrid[k][q]) + ' ')
					f.write('1 0 0 0\n')
			else:
				for j in range(stim_time):
					for k in range(n):
						for q in range(n):
							f.write(str(inputGrid[k][q]) + ' ')
					f.write('1 0 0 0\n')

			# then delay
			if rand_delay:
				delay = random.randint(delay_time - delay_var, delay_time + delay_var)
				out_len += (delay_time - delay)
				for j in range(delay):
					for k in range(n*n):
						f.write('0 ')
					f.write('1 0 0 0\n')
			else:
				for j in range(delay_time):
					for k in range(n*n):
						f.write('0 ')
					f.write('1 0 0 0\n')

			# then output
			for j in range(out_len):
				for k in range(n*n):
					f.write('0 ')
				f.write('0 1 0 0\n')

			f.write('end\n')

			f.write('output-' + str(targets[i]).replace(' ', ''))
			f.write('\n')

			if rand_input:
				for j in range(stim):
					f.write('0 0 0 0')
					f.write('\n')
			else:
				for j in range(stim_time):
					f.write('0 0 0 0')
					f.write('\n')

			if rand_delay:
				for j in range(delay):
					f.write('0 0 0 0')
					f.write('\n')
			else:
				for j in range(delay_time):
					f.write('0 0 0 0')
					f.write('\n')

			for j in range(out_len):
				line = ""
				for k in range(len(targets[i])):
					line += str(targets[i][k]) + ' '
				f.write(line[0:-1])
				f.write('\n')

			f.write('end\n')

	f.close()

def main():
	# fname = raw_input("What do you wish to name the output file?\n")
	# while fname == "":
	# 	print "You must give a file name."
	# 	fname = raw_input("What do you wish to name the output file?\n")

	default = isYes("Use default trial parameters?", "yes")

	if default:
		n = 11
		num_inputs = 12
		stim_time = 5
		delay_time = 5
		output_time = 5
		rand_input = False
		rand_delay = False
		test = False
	else:
		test = isYes("Is this for testing purposes? (as opposed to training)\n")
		n = int(raw_input("What is the side length (n) of the 2D input space? (Odd numbers only)\n"))
		num_inputs = int(raw_input("How many targets should there be?\n"))
		stim_time = int(raw_input("How long should the stimulus presentation be?\n"))
		delay_time = int(raw_input("How long should the delay period be?\n"))
		output_time = int(raw_input("How long should the output presentation be?\n"))
		max_trial = stim_time + delay_time + output_time
		rand_input = isYes("Should there be randomized input periods?\n")
		if rand_input:
			input_var = int(raw_input("What is the range of input variability in time steps? (Ex: 2 would mean stimulus +- 2 steps)\n"))
			max_trial += input_var
		rand_delay = isYes("Should there be randomized delay periods?\n")
		if rand_delay:
			delay_var = int(raw_input("What is the range of delay variability in time steps? (Ex: 2 would mean delay +- 2 steps)\n"))
			max_trial += delay_var

	if rand_delay or rand_input:
		rand = random.seed()
		reps = int(raw_input("Finally, what are the number of repetitions of random length?\n"))
	else:
		reps = 1

	inputGen(n=n, num_inputs=num_inputs, stim_time=stim_time,
			 delay_time=delay_time, output_time=output_time,
			 rand_input=rand_input, rand_delay=rand_delay, test=test,
			 reps=reps, input_var=input_var, delay_var=delay_var)

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

if __name__ == "__main__":
    main()
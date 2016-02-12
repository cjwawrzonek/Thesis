###################################################################################
#
###################################################################################

import sys
import inputSpaces as ips

def main():
    fname = raw_input("What do you wish to name the output file?\n")
    n = raw_input("What is the side length (n) of the 2D input space? (Odd numbers only)\n")
    num_inputs = raw_input("How many targets should there be?\n")

    # f = open(fname, "wb+")

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
    		dyPlus = dy
    		dyMinus = 0
    	else:
    		dyPlus = 0
    		dyMinus = abs(dy)

    	targets.append([dxPlus, dxMinus, dyPlus, dyMinus])
    	print targets[-1]


def oldMain():
	f = open("testInput" + str(1) + ".txt", "wb+")
	# Here, the coordinates are (x, -x, y, -y)
	# These are the four corners
	# targetOutput = [[0,1,1,0], [1,0,1,0], [1,0,0,1], [0,1,0,1]]
	targetLocations = ["0 1 1 0", "1 0 1 0", "1 0 0 1", "0 1 0 1"]
	stim_dim = 25
	inputLocations = ["1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0",
					  "0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0",
					  "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1",
					  "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0"]
	stim_time = 3
	delay_time = 3
	output_time = 3

	for i in range(len(targetLocations)):
		f.write('input-' + targetLocations[i])
		f.write('\n')

		for j in range(stim_time):
			f.write(inputLocations[i] + ' 1 0 0 0')
			f.write('\n')

		for j in range(delay_time):
			for k in range(stim_dim):
				f.write('0 ')
			f.write('1 0 0 0')
			f.write('\n')

		for j in range(output_time):
			for k in range(stim_dim):
				f.write('0 ')
			f.write('0 1 0 0')
			f.write('\n')

		f.write('end\n')

		f.write('output-' + targetLocations[i])
		f.write('\n')

		for j in range(stim_time + delay_time):
			f.write('0 0 0 0')
			f.write('\n')

		for j in range(output_time):
			f.write(targetLocations[i])
			f.write('\n')

		f.write('end\n')

	f.close()

if __name__ == "__main__":
    main()
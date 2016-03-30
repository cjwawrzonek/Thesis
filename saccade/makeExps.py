import sys
import os
import experiment as e

def makeExps(expRoot):
	exp = 97

	for expType in ['selection, attention, combined']:
		for locs in [8, 16, 20, 24, 32]:
			for pct in [80, 85, 87, 90, 92, 95]:
				for layer in [9, 16, 25, 36, 49]:
					for input_side in [15, 17]
						if not os.path.exists("{}".format(expRoot)):
							os.makedirs("{}".format(expRoot))
						if not os.path.exists("{}/{}{}".format(expRoot, expType, exp)):
							os.makedirs("{}/{}{}".format(expRoot, expType, exp))
						fpath = "{}/{}{}/{}{}.exp".format(expRoot, expType, exp, expType, exp)
						f = open(fpath, "wb+")

						f.write('''## {} Experiment
description		{} experiment
name			{}{}
directory		{}/{}{}
type			{}
total_length	18
phase_times		{{"delay":5,"output":5,"cue":3,"locs":5}}
num_locs		{}
input_side		{}
hidden_layer	{}
out_layer		4
init_weights	init_weights
train_shuffle	true
loc_connect		false
phase_var		{{"delay":false,"cue":false,"locs":false}}
variance		2
train_pct		{}'''.format(expType, expType, expType, exp, expRoot, expType, exp,
							 expType, locs, input_side, layer, pct))
						f.close()
						exp += 1


def main():
	if len(sys.argv) < 2:
		raise Exception("Please specify a root directory for your experiments:\n"
			"Usage: python makeExps [directory]")
	else:
		makeExps(sys.argv[1])

if __name__ == "__main__":
	main()
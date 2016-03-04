import sys
import os

def makeExps(expType):
	exp = 1

	for locs in [4, 8, 16]:
		for pct in [50, 75, 90, 100]:
			for layer in [16, 25, 64, 144]:
				if not os.path.exists("experiments"):
					os.makedirs("experiments")
				if not os.path.exists("experiments/{}{}".format(expType, exp)):
					os.makedirs("experiments/{}{}".format(expType, exp))
				fpath = "experiments/{}{}/{}{}.exp".format(expType, exp, expType, exp)
				f = open(fpath, "wb+")

				f.write('''## {} Experiment
description	{} experiment
directory	{}{}
type		{}
total_length	18
phase_times	{{"delay":5,"output":5,"cue":3,"locs":5}}
num_locs	{}
input_side	11
hidden_layer	{}
out_layer	4
init_weights	init_weights
train_shuffle	true
loc_connect	false
phase_var	{{"delay":false,"cue":false,"locs":false}}
variance	2
train_pct	{}'''.format(expType, expType, expType, exp, expType, locs, layer, pct))
				f.close()
				exp += 1


def main():
	if len(sys.argv) < 2:
		raise Exception("Usage: python makeExps.py [type]\n\nType: attention / selection / combined")
	if sys.argv[1] == "attention":
		makeExps("attention")
	elif sys.argv[1] == "selection":
		makeExps("selection")
	elif sys.argv[1] == "combined":
		makeExps("combined")
	else:
		raise Exception("Usage: python makeExps.py [type]\n\nType: attention / selection / combined")

if __name__ == "__main__":
	main()
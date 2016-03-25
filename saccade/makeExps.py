import sys
import os
import experiment as e

def makeExps(expType):
	exp = 97

	for locs in [32]:
		for pct in [92]:
			for layer in [16, 25, 36, 49]:
				if not os.path.exists("experiments"):
					os.makedirs("experiments")
				if not os.path.exists("experiments/{}{}".format(expType, exp)):
					os.makedirs("experiments/{}{}".format(expType, exp))
				fpath = "experiments/{}{}/{}{}.exp".format(expType, exp, expType, exp)
				f = open(fpath, "wb+")

				f.write('''## {} Experiment
description		{} experiment
name			{}{}
directory		experiments/{}{}
type			{}
total_length	18
phase_times		{{"delay":5,"output":5,"cue":3,"locs":5}}
num_locs		{}
input_side		15
hidden_layer	{}
out_layer		4
init_weights	init_weights
train_shuffle	true
loc_connect		false
phase_var		{{"delay":false,"cue":false,"locs":false}}
variance		2
train_pct		{}'''.format(expType, expType, expType, exp, expType, exp, expType, locs, layer, pct))
				f.close()
				exp += 1


def main():
	if len(sys.argv) < 2:
		print "\nMaking experiments for attention, selection, and combined\n"
		makeExps("attention")
		makeExps("selection")
		makeExps("combined")
	elif sys.argv[1] == "attention":
		makeExps("attention")
	elif sys.argv[1] == "selection":
		makeExps("selection")
	elif sys.argv[1] == "combined":
		makeExps("combined")
	else:
		raise Exception("Usage: python makeExps.py [optional: type]\n\nType: attention / selection / combined")

	# for expType in ['selection', 'attention', 'combined']:
	# 	expNum = 49
	# 	while os.path.exists("experiments/{}{}".format(expType, expNum)):
	# 		exp = e.experiment()
	# 		exp.read("experiments/{}{}/{}{}.exp".format(expType, expNum, expType, expNum))
	# 		print exp
	# 		expNum += 1


if __name__ == "__main__":
	main()
import sys
import os
import experiment as e

def makeExps(expRoot):

	for expType in ['selection', 'attention', 'combined']:
		expNum = 1
		for locs in [8, 16, 24, 32]:
			for pct in [80, 85, 87, 90, 92]:
				for layer in [9, 16, 25, 36, 49]:
					if not os.path.exists("{}".format(expRoot)):
						os.makedirs("{}".format(expRoot))
					if not os.path.exists("{}/{}{}".format(expRoot, expType, expNum)):
						os.makedirs("{}/{}{}".format(expRoot, expType, expNum))
					fpath = "{}/{}{}/{}{}.exp".format(expRoot, expType, expNum, expType, expNum)
					f = open(fpath, "wb+")

					f.write('''## {} Experiment
description		{} experiment
version			3
name			{}{}
directory		{}/{}{}
type			{}
phase_times		{{"delay":5,"output":3,"cue":3,"locs":3,"pause1":3,"pause2":3}}
att_order		["cue","pause1","locs","pause2","locs","delay","output"]
sel_order		["locs","pause1","locs","pause2","cue","delay","output"]
gauss_inputs	True
num_locs		{}
hidden_layer	{}
out_layer		4
init_weights	init_weights
train_shuffle	true
loc_connect		false
phase_var		{{"delay":false,"cue":false,"locs":false}}
train_pct		{}'''.format(expType, expType, expType, expNum, expRoot, expType, expNum,
							 expType, locs, layer, pct))
					f.close()
					expNum += 1

def makeExpsVariable(expRoot):
	raise Exception("Function not yet implemented.")

def main():
	if len(sys.argv) < 2:
		raise Exception("Please specify a root directory for your experiments:\n"
			"Usage: python makeExps [directory]")
	else:
		makeExps(sys.argv[1])

if __name__ == "__main__":
	main()
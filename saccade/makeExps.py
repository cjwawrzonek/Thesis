import sys
import os
import experiment as e

def makeExpsSimple(expRoot):

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
version			2
name			{}{}
directory		{}/{}{}
type			{}
phase_times		{{"delay":5,"output":3,"cue":3,"locs":3,"pause1":3,"pause2":3}}
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
	if len(sys.argv) < 3:
		raise Exception("Please specify a root directory for your experiments and exp type:\n"
			"Usage: python makeExps [directory] [type: 1/2]")
	else:
		if sys.argv[2] is "1":
			makeExpsSimple(sys.argv[1])
		elif sys.argv[2] is "2":
			makeExpsVariable(sys.argv[1])
		else:
			raise Exception("That exp type is not recognized.")

if __name__ == "__main__":
	main()
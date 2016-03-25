import sys
import os

def makeScripts(expType):
	exp = 1

	while os.path.exists("experiments/{}{}".format(expType, exp)):
		f = open("scripts/{}{}.sh".format(expType, exp), "wb+")
		expName = "{}{}".format(expType, exp)
		fstring = '''#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/{}/{}.exp"
if [ -f $FPATH ]; then
	python experiment.py {} experiments/{}
fi'''.format(expName, expName, expName, expName)
		f.write(fstring)
		f.close()
		exp += 1

def main():
	if len(sys.argv) < 2:
		raise Exception("Usage: python makeScripts.py [type]\n\nType: attention / selection / combined / all")
	if sys.argv[1] == "attention":
		makeScripts("attention")
	elif sys.argv[1] == "selection":
		makeScripts("selection")
	elif sys.argv[1] == "combined":
		makeScripts("combined")
	elif sys.argv[1] == "all":
		makeScripts("combined")
		makeScripts("attention")
		makeScripts("selection")
	else:
		raise Exception("Usage: python makeScripts.py [type]\n\nType: attention / selection / combined / all")

if __name__ == "__main__":
	main()
import sys
import os

def makeScripts(expType):
	exp = 1

	while os.path.exists("experiments/{}{}".format(expType, exp)):
		f = open("scripts/{}{}.sh".format(expType, exp), "wb+")
		fstring = '''#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
python experiment.py {}{} experiments/{}{}'''.format(expType, exp, expType, exp)
		f.write(fstring)
		f.close()
		exp += 1

def main():
	if len(sys.argv) < 2:
		raise Exception("Usage: python makeScripts.py [type]\n\nType: attention / selection / combined")
	if sys.argv[1] == "attention":
		makeScripts("attention")
	elif sys.argv[1] == "selection":
		makeScripts("selection")
	elif sys.argv[1] == "combined":
		makeScripts("combined")
	else:
		raise Exception("Usage: python makeScripts.py [type]\n\nType: attention / selection / combined")

if __name__ == "__main__":
	main()
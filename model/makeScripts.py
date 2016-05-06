import sys
import os

def makeScripts(expRoot):

	if not os.path.exists("{}".format(expRoot)):
		raise Exception("No experiment directory root named: {}".format(expRoot))
	if not os.path.exists("{}/scripts".format(expRoot)):
		os.makedirs("{}/scripts".format(expRoot))
	for expType in ['selection', 'attention', 'combined']:
		expNum = 1
		expName = "{}{}".format(expType, expNum)
		while os.path.exists("{}/{}".format(expRoot, expName)):
			f = open("{}/scripts/{}.sh".format(expRoot, expName), "wb+")
			fstring = '''#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="{}/{}/{}.exp"
if [ -f $FPATH ]; then
	python experiment.py {} {}/{}
fi'''.format(expRoot, expName, expName, expName, expRoot, expName)
			f.write(fstring)
			f.close()
			expNum += 1
			expName = "{}{}".format(expType, expNum)

	# Now make the master script
	f = open("{}/scripts/master.sh".format(expRoot), "wb+")
	fstring = '''#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] master.sh
#          Script for submitting batch experiment runs
# ------------------------------------------------------------------

# remove outputs from old training runs
rm -f *.sh.o*

#######################################################
# attention experiments
#######################################################

((i=1))
FILE="attention$i.sh"
while [ -f $FILE ];
do
	chmod +x $FILE;
	submit_long ./attention$i.sh;
	((i++))
	FILE="attention$i.sh"
done
((i=i-1))
FILE="attention$i.sh"
echo "$FILE was the final attention script submitted"
echo ""

#######################################################
# selection experiments
#######################################################

((i=1))
FILE="selection$i.sh"
while [ -f $FILE ];
do
	chmod +x $FILE;
	submit_long ./selection$i.sh;
	((i++))
	FILE="selection$i.sh"
done
((i=i-1))
FILE="selection$i.sh"
echo "$FILE was the final selection script submitted"
echo ""

#######################################################
# combined experiments
#######################################################

((i=1))
FILE="combined$i.sh"
while [ -f $FILE ];
do
	chmod +x $FILE;
	submit_long ./combined$i.sh;
	((i++))
	FILE="combined$i.sh"
done
((i=i-1))
FILE="combined$i.sh"
echo "$FILE was the final combined script submitted"
echo ""'''
	f.write(fstring)
	f.close()


def main():
	if len(sys.argv) < 2:
		raise Exception("Please specify a root directory to find your experiments:\n"
			"Usage: python makeScripts [directory]")
	else:
		makeScripts(sys.argv[1])

if __name__ == "__main__":
	main()
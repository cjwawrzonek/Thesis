#!/bin/bash
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
echo ""
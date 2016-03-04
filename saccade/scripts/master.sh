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

FILE="attention1.sh"
((i=1))
while [ -f $FILE ];
do
	chmod +x $FILE;
	submit attention$i.sh;
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

FILE="selection1.sh"
((i=1))
while [ -f $FILE ];
do
	chmod +x $FILE;
	submit selection$i.sh;
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

FILE="combined1.sh"
((i=1))
while [ -f $FILE ];
do
	chmod +x $FILE;
	submit combined$i.sh;
	((i++))
	FILE="combined$i.sh"
done
((i=i-1))
FILE="combined$i.sh"
echo "$FILE was the final combined script submitted"
echo ""

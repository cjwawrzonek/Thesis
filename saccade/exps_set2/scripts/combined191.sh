#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined191/combined191.exp"
if [ -f $FPATH ]; then
	python experiment.py combined191 exps_set2/combined191
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined147/combined147.exp"
if [ -f $FPATH ]; then
	python experiment.py combined147 exps_set2/combined147
fi
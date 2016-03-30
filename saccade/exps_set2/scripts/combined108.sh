#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined108/combined108.exp"
if [ -f $FPATH ]; then
	python experiment.py combined108 exps_set2/combined108
fi
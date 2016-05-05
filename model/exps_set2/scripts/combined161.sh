#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined161/combined161.exp"
if [ -f $FPATH ]; then
	python experiment.py combined161 exps_set2/combined161
fi
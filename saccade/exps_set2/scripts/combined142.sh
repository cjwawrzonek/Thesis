#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined142/combined142.exp"
if [ -f $FPATH ]; then
	python experiment.py combined142 exps_set2/combined142
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined104/combined104.exp"
if [ -f $FPATH ]; then
	python experiment.py combined104 exps_set2/combined104
fi
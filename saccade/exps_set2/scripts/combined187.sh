#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined187/combined187.exp"
if [ -f $FPATH ]; then
	python experiment.py combined187 exps_set2/combined187
fi
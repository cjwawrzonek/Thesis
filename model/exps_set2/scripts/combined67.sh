#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined67/combined67.exp"
if [ -f $FPATH ]; then
	python experiment.py combined67 exps_set2/combined67
fi
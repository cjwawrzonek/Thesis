#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined118/combined118.exp"
if [ -f $FPATH ]; then
	python experiment.py combined118 exps_set2/combined118
fi
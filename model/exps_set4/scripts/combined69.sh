#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined69/combined69.exp"
if [ -f $FPATH ]; then
	python experiment.py combined69 exps_set4/combined69
fi
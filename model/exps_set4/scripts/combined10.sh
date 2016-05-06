#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined10/combined10.exp"
if [ -f $FPATH ]; then
	python experiment.py combined10 exps_set4/combined10
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined23/combined23.exp"
if [ -f $FPATH ]; then
	python experiment.py combined23 exps_set4/combined23
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined48/combined48.exp"
if [ -f $FPATH ]; then
	python experiment.py combined48 exps_set4/combined48
fi
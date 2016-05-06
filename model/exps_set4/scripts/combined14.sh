#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined14/combined14.exp"
if [ -f $FPATH ]; then
	python experiment.py combined14 exps_set4/combined14
fi
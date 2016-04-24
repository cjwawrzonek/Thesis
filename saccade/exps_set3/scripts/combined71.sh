#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined71/combined71.exp"
if [ -f $FPATH ]; then
	python experiment.py combined71 exps_set3/combined71
fi
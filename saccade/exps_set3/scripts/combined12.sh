#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined12/combined12.exp"
if [ -f $FPATH ]; then
	python experiment.py combined12 exps_set3/combined12
fi
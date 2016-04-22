#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined61/combined61.exp"
if [ -f $FPATH ]; then
	python experiment.py combined61 exps_set3/combined61
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined25/combined25.exp"
if [ -f $FPATH ]; then
	python experiment.py combined25 exps_set3/combined25
fi
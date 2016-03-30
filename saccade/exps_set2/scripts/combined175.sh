#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined175/combined175.exp"
if [ -f $FPATH ]; then
	python experiment.py combined175 exps_set2/combined175
fi
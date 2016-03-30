#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined151/combined151.exp"
if [ -f $FPATH ]; then
	python experiment.py combined151 exps_set2/combined151
fi
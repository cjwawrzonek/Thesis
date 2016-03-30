#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention162/attention162.exp"
if [ -f $FPATH ]; then
	python experiment.py attention162 exps_set2/attention162
fi
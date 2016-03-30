#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention75/attention75.exp"
if [ -f $FPATH ]; then
	python experiment.py attention75 exps_set2/attention75
fi
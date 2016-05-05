#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention13/attention13.exp"
if [ -f $FPATH ]; then
	python experiment.py attention13 exps_set2/attention13
fi
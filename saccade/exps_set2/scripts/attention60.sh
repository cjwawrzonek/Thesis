#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention60/attention60.exp"
if [ -f $FPATH ]; then
	python experiment.py attention60 exps_set2/attention60
fi
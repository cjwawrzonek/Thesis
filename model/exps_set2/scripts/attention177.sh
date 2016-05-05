#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention177/attention177.exp"
if [ -f $FPATH ]; then
	python experiment.py attention177 exps_set2/attention177
fi
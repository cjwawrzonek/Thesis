#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention136/attention136.exp"
if [ -f $FPATH ]; then
	python experiment.py attention136 exps_set2/attention136
fi
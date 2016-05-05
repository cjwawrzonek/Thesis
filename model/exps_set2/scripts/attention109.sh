#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention109/attention109.exp"
if [ -f $FPATH ]; then
	python experiment.py attention109 exps_set2/attention109
fi
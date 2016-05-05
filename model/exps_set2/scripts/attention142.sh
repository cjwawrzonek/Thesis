#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention142/attention142.exp"
if [ -f $FPATH ]; then
	python experiment.py attention142 exps_set2/attention142
fi
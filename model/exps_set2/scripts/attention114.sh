#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention114/attention114.exp"
if [ -f $FPATH ]; then
	python experiment.py attention114 exps_set2/attention114
fi
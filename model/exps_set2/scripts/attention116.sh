#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention116/attention116.exp"
if [ -f $FPATH ]; then
	python experiment.py attention116 exps_set2/attention116
fi
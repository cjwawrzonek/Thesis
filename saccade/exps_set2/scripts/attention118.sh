#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention118/attention118.exp"
if [ -f $FPATH ]; then
	python experiment.py attention118 exps_set2/attention118
fi
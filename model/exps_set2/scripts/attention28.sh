#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention28/attention28.exp"
if [ -f $FPATH ]; then
	python experiment.py attention28 exps_set2/attention28
fi
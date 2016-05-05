#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention227/attention227.exp"
if [ -f $FPATH ]; then
	python experiment.py attention227 exps_set2/attention227
fi
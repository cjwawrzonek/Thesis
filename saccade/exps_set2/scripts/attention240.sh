#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention240/attention240.exp"
if [ -f $FPATH ]; then
	python experiment.py attention240 exps_set2/attention240
fi
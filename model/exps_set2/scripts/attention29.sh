#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention29/attention29.exp"
if [ -f $FPATH ]; then
	python experiment.py attention29 exps_set2/attention29
fi
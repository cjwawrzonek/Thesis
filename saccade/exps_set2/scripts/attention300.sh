#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention300/attention300.exp"
if [ -f $FPATH ]; then
	python experiment.py attention300 exps_set2/attention300
fi
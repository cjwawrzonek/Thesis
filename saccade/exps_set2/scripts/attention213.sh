#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention213/attention213.exp"
if [ -f $FPATH ]; then
	python experiment.py attention213 exps_set2/attention213
fi
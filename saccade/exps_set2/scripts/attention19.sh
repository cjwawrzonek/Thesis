#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention19/attention19.exp"
if [ -f $FPATH ]; then
	python experiment.py attention19 exps_set2/attention19
fi
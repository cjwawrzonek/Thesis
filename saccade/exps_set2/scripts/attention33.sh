#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention33/attention33.exp"
if [ -f $FPATH ]; then
	python experiment.py attention33 exps_set2/attention33
fi
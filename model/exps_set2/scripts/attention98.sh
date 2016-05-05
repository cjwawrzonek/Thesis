#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention98/attention98.exp"
if [ -f $FPATH ]; then
	python experiment.py attention98 exps_set2/attention98
fi
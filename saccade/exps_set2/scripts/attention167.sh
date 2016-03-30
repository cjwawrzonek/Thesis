#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention167/attention167.exp"
if [ -f $FPATH ]; then
	python experiment.py attention167 exps_set2/attention167
fi
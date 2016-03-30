#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention237/attention237.exp"
if [ -f $FPATH ]; then
	python experiment.py attention237 exps_set2/attention237
fi
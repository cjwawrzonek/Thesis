#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention274/attention274.exp"
if [ -f $FPATH ]; then
	python experiment.py attention274 exps_set2/attention274
fi
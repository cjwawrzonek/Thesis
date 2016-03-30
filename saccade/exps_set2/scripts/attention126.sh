#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention126/attention126.exp"
if [ -f $FPATH ]; then
	python experiment.py attention126 exps_set2/attention126
fi
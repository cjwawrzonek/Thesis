#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention137/attention137.exp"
if [ -f $FPATH ]; then
	python experiment.py attention137 exps_set2/attention137
fi
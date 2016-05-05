#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention277/attention277.exp"
if [ -f $FPATH ]; then
	python experiment.py attention277 exps_set2/attention277
fi
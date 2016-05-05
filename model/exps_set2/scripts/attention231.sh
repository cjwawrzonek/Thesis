#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention231/attention231.exp"
if [ -f $FPATH ]; then
	python experiment.py attention231 exps_set2/attention231
fi
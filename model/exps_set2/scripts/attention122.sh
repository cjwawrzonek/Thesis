#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention122/attention122.exp"
if [ -f $FPATH ]; then
	python experiment.py attention122 exps_set2/attention122
fi
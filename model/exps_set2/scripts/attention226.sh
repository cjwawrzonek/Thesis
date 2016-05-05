#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention226/attention226.exp"
if [ -f $FPATH ]; then
	python experiment.py attention226 exps_set2/attention226
fi
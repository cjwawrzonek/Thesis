#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention158/attention158.exp"
if [ -f $FPATH ]; then
	python experiment.py attention158 exps_set2/attention158
fi
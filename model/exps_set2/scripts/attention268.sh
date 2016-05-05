#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention268/attention268.exp"
if [ -f $FPATH ]; then
	python experiment.py attention268 exps_set2/attention268
fi
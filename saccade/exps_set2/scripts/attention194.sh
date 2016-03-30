#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention194/attention194.exp"
if [ -f $FPATH ]; then
	python experiment.py attention194 exps_set2/attention194
fi
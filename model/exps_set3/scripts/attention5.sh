#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention5/attention5.exp"
if [ -f $FPATH ]; then
	python experiment.py attention5 exps_set3/attention5
fi
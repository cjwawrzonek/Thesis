#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention22/attention22.exp"
if [ -f $FPATH ]; then
	python experiment.py attention22 exps_set3/attention22
fi
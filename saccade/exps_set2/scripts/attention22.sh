#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention22/attention22.exp"
if [ -f $FPATH ]; then
	python experiment.py attention22 exps_set2/attention22
fi
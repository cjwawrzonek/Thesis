#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention10/attention10.exp"
if [ -f $FPATH ]; then
	python experiment.py attention10 exps_set2/attention10
fi
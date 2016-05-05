#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention44/attention44.exp"
if [ -f $FPATH ]; then
	python experiment.py attention44 exps_set2/attention44
fi
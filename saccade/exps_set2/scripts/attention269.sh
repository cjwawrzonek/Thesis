#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention269/attention269.exp"
if [ -f $FPATH ]; then
	python experiment.py attention269 exps_set2/attention269
fi
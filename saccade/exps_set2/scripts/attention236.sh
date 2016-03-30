#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention236/attention236.exp"
if [ -f $FPATH ]; then
	python experiment.py attention236 exps_set2/attention236
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention31/attention31.exp"
if [ -f $FPATH ]; then
	python experiment.py attention31 exps_set2/attention31
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention115/attention115.exp"
if [ -f $FPATH ]; then
	python experiment.py attention115 exps_set2/attention115
fi
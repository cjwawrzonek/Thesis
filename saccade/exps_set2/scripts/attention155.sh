#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention155/attention155.exp"
if [ -f $FPATH ]; then
	python experiment.py attention155 exps_set2/attention155
fi
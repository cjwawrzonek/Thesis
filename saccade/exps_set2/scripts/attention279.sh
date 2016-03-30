#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention279/attention279.exp"
if [ -f $FPATH ]; then
	python experiment.py attention279 exps_set2/attention279
fi
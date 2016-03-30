#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention1/attention1.exp"
if [ -f $FPATH ]; then
	python experiment.py attention1 exps_set2/attention1
fi
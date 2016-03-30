#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention234/attention234.exp"
if [ -f $FPATH ]; then
	python experiment.py attention234 exps_set2/attention234
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention55/attention55.exp"
if [ -f $FPATH ]; then
	python experiment.py attention55 exps_set2/attention55
fi
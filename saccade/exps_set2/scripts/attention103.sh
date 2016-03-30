#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention103/attention103.exp"
if [ -f $FPATH ]; then
	python experiment.py attention103 exps_set2/attention103
fi
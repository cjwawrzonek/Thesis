#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention256/attention256.exp"
if [ -f $FPATH ]; then
	python experiment.py attention256 exps_set2/attention256
fi
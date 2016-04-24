#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention62/attention62.exp"
if [ -f $FPATH ]; then
	python experiment.py attention62 exps_set3/attention62
fi
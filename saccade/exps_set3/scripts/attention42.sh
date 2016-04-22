#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention42/attention42.exp"
if [ -f $FPATH ]; then
	python experiment.py attention42 exps_set3/attention42
fi
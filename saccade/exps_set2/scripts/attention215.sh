#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention215/attention215.exp"
if [ -f $FPATH ]; then
	python experiment.py attention215 exps_set2/attention215
fi
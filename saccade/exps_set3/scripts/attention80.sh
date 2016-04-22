#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention80/attention80.exp"
if [ -f $FPATH ]; then
	python experiment.py attention80 exps_set3/attention80
fi
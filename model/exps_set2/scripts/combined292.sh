#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined292/combined292.exp"
if [ -f $FPATH ]; then
	python experiment.py combined292 exps_set2/combined292
fi
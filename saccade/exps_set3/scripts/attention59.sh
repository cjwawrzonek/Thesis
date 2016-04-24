#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention59/attention59.exp"
if [ -f $FPATH ]; then
	python experiment.py attention59 exps_set3/attention59
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention4/attention4.exp"
if [ -f $FPATH ]; then
	python experiment.py attention4 exps_set4/attention4
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention56/attention56.exp"
if [ -f $FPATH ]; then
	python experiment.py attention56 exps_set4/attention56
fi
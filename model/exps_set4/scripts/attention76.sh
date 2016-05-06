#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention76/attention76.exp"
if [ -f $FPATH ]; then
	python experiment.py attention76 exps_set4/attention76
fi
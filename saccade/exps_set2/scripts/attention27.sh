#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention27/attention27.exp"
if [ -f $FPATH ]; then
	python experiment.py attention27 exps_set2/attention27
fi
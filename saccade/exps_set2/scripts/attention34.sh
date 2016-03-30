#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention34/attention34.exp"
if [ -f $FPATH ]; then
	python experiment.py attention34 exps_set2/attention34
fi
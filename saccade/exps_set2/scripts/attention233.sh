#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention233/attention233.exp"
if [ -f $FPATH ]; then
	python experiment.py attention233 exps_set2/attention233
fi
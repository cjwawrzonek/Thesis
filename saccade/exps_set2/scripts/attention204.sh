#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention204/attention204.exp"
if [ -f $FPATH ]; then
	python experiment.py attention204 exps_set2/attention204
fi
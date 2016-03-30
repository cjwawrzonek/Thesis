#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention287/attention287.exp"
if [ -f $FPATH ]; then
	python experiment.py attention287 exps_set2/attention287
fi
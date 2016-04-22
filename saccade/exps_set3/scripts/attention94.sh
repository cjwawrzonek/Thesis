#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention94/attention94.exp"
if [ -f $FPATH ]; then
	python experiment.py attention94 exps_set3/attention94
fi
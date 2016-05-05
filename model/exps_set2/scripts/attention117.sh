#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention117/attention117.exp"
if [ -f $FPATH ]; then
	python experiment.py attention117 exps_set2/attention117
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention129/attention129.exp"
if [ -f $FPATH ]; then
	python experiment.py attention129 exps_set2/attention129
fi
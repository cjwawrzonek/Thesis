#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention252/attention252.exp"
if [ -f $FPATH ]; then
	python experiment.py attention252 exps_set2/attention252
fi
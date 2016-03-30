#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention286/attention286.exp"
if [ -f $FPATH ]; then
	python experiment.py attention286 exps_set2/attention286
fi
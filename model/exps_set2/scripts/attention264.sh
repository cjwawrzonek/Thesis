#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention264/attention264.exp"
if [ -f $FPATH ]; then
	python experiment.py attention264 exps_set2/attention264
fi
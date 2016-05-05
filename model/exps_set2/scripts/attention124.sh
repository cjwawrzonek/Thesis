#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention124/attention124.exp"
if [ -f $FPATH ]; then
	python experiment.py attention124 exps_set2/attention124
fi
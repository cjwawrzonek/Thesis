#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention96/attention96.exp"
if [ -f $FPATH ]; then
	python experiment.py attention96 exps_set2/attention96
fi
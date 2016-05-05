#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention134/attention134.exp"
if [ -f $FPATH ]; then
	python experiment.py attention134 exps_set2/attention134
fi
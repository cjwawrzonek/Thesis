#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention216/attention216.exp"
if [ -f $FPATH ]; then
	python experiment.py attention216 exps_set2/attention216
fi
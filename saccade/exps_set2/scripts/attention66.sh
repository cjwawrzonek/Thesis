#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention66/attention66.exp"
if [ -f $FPATH ]; then
	python experiment.py attention66 exps_set2/attention66
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention89/attention89.exp"
if [ -f $FPATH ]; then
	python experiment.py attention89 exps_set2/attention89
fi
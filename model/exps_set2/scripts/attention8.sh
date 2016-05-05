#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention8/attention8.exp"
if [ -f $FPATH ]; then
	python experiment.py attention8 exps_set2/attention8
fi
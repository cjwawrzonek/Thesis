#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention71/attention71.exp"
if [ -f $FPATH ]; then
	python experiment.py attention71 exps_set2/attention71
fi
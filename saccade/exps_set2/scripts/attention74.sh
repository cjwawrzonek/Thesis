#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention74/attention74.exp"
if [ -f $FPATH ]; then
	python experiment.py attention74 exps_set2/attention74
fi
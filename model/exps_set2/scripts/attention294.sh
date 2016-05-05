#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention294/attention294.exp"
if [ -f $FPATH ]; then
	python experiment.py attention294 exps_set2/attention294
fi
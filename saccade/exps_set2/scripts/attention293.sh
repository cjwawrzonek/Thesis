#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention293/attention293.exp"
if [ -f $FPATH ]; then
	python experiment.py attention293 exps_set2/attention293
fi
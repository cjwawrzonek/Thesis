#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention200/attention200.exp"
if [ -f $FPATH ]; then
	python experiment.py attention200 exps_set2/attention200
fi
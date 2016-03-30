#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention244/attention244.exp"
if [ -f $FPATH ]; then
	python experiment.py attention244 exps_set2/attention244
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention92/attention92.exp"
if [ -f $FPATH ]; then
	python experiment.py attention92 exps_set2/attention92
fi
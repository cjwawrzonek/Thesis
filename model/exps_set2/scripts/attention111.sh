#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention111/attention111.exp"
if [ -f $FPATH ]; then
	python experiment.py attention111 exps_set2/attention111
fi
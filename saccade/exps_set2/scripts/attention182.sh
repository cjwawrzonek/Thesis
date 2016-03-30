#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention182/attention182.exp"
if [ -f $FPATH ]; then
	python experiment.py attention182 exps_set2/attention182
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention169/attention169.exp"
if [ -f $FPATH ]; then
	python experiment.py attention169 exps_set2/attention169
fi
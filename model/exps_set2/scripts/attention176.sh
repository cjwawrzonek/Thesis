#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention176/attention176.exp"
if [ -f $FPATH ]; then
	python experiment.py attention176 exps_set2/attention176
fi
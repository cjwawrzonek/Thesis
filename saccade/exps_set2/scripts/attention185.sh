#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention185/attention185.exp"
if [ -f $FPATH ]; then
	python experiment.py attention185 exps_set2/attention185
fi
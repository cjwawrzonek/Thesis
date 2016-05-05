#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention257/attention257.exp"
if [ -f $FPATH ]; then
	python experiment.py attention257 exps_set2/attention257
fi
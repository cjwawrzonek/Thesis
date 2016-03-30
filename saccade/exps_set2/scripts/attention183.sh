#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention183/attention183.exp"
if [ -f $FPATH ]; then
	python experiment.py attention183 exps_set2/attention183
fi
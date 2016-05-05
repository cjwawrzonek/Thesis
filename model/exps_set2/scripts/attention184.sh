#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention184/attention184.exp"
if [ -f $FPATH ]; then
	python experiment.py attention184 exps_set2/attention184
fi
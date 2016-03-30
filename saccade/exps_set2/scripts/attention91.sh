#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention91/attention91.exp"
if [ -f $FPATH ]; then
	python experiment.py attention91 exps_set2/attention91
fi
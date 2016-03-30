#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention207/attention207.exp"
if [ -f $FPATH ]; then
	python experiment.py attention207 exps_set2/attention207
fi
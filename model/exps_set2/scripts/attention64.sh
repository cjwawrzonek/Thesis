#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention64/attention64.exp"
if [ -f $FPATH ]; then
	python experiment.py attention64 exps_set2/attention64
fi
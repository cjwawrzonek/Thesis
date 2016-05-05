#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention78/attention78.exp"
if [ -f $FPATH ]; then
	python experiment.py attention78 exps_set3/attention78
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention260/attention260.exp"
if [ -f $FPATH ]; then
	python experiment.py attention260 exps_set2/attention260
fi
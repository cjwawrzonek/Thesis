#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention190/attention190.exp"
if [ -f $FPATH ]; then
	python experiment.py attention190 exps_set2/attention190
fi
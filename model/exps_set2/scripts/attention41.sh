#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention41/attention41.exp"
if [ -f $FPATH ]; then
	python experiment.py attention41 exps_set2/attention41
fi
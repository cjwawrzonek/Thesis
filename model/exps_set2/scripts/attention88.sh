#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention88/attention88.exp"
if [ -f $FPATH ]; then
	python experiment.py attention88 exps_set2/attention88
fi
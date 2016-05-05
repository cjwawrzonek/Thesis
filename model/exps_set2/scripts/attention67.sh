#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention67/attention67.exp"
if [ -f $FPATH ]; then
	python experiment.py attention67 exps_set2/attention67
fi
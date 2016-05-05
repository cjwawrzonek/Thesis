#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention107/attention107.exp"
if [ -f $FPATH ]; then
	python experiment.py attention107 exps_set2/attention107
fi
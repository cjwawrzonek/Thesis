#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection207/selection207.exp"
if [ -f $FPATH ]; then
	python experiment.py selection207 exps_set2/selection207
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection169/selection169.exp"
if [ -f $FPATH ]; then
	python experiment.py selection169 exps_set2/selection169
fi
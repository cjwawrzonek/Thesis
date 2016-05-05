#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection123/selection123.exp"
if [ -f $FPATH ]; then
	python experiment.py selection123 exps_set2/selection123
fi
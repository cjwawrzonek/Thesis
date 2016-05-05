#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection250/selection250.exp"
if [ -f $FPATH ]; then
	python experiment.py selection250 exps_set2/selection250
fi
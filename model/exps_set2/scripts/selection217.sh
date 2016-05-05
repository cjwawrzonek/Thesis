#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection217/selection217.exp"
if [ -f $FPATH ]; then
	python experiment.py selection217 exps_set2/selection217
fi
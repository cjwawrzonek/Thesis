#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection219/selection219.exp"
if [ -f $FPATH ]; then
	python experiment.py selection219 exps_set2/selection219
fi
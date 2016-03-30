#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection133/selection133.exp"
if [ -f $FPATH ]; then
	python experiment.py selection133 exps_set2/selection133
fi
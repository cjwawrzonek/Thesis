#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection186/selection186.exp"
if [ -f $FPATH ]; then
	python experiment.py selection186 exps_set2/selection186
fi
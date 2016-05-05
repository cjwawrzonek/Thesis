#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection272/selection272.exp"
if [ -f $FPATH ]; then
	python experiment.py selection272 exps_set2/selection272
fi
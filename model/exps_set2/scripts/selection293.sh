#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection293/selection293.exp"
if [ -f $FPATH ]; then
	python experiment.py selection293 exps_set2/selection293
fi
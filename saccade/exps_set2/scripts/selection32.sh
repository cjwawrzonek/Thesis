#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection32/selection32.exp"
if [ -f $FPATH ]; then
	python experiment.py selection32 exps_set2/selection32
fi
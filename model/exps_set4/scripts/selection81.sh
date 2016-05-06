#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection81/selection81.exp"
if [ -f $FPATH ]; then
	python experiment.py selection81 exps_set4/selection81
fi
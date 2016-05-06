#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection4/selection4.exp"
if [ -f $FPATH ]; then
	python experiment.py selection4 exps_set4/selection4
fi
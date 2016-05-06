#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection90/selection90.exp"
if [ -f $FPATH ]; then
	python experiment.py selection90 exps_set4/selection90
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection13/selection13.exp"
if [ -f $FPATH ]; then
	python experiment.py selection13 exps_set4/selection13
fi
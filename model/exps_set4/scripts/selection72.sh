#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection72/selection72.exp"
if [ -f $FPATH ]; then
	python experiment.py selection72 exps_set4/selection72
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection79/selection79.exp"
if [ -f $FPATH ]; then
	python experiment.py selection79 exps_set4/selection79
fi
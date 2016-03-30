#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection79/selection79.exp"
if [ -f $FPATH ]; then
	python experiment.py selection79 exps_set2/selection79
fi
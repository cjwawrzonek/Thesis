#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection159/selection159.exp"
if [ -f $FPATH ]; then
	python experiment.py selection159 exps_set2/selection159
fi
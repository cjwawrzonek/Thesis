#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection194/selection194.exp"
if [ -f $FPATH ]; then
	python experiment.py selection194 exps_set2/selection194
fi
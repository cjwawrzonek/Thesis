#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection179/selection179.exp"
if [ -f $FPATH ]; then
	python experiment.py selection179 exps_set2/selection179
fi
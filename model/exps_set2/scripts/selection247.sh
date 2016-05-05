#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection247/selection247.exp"
if [ -f $FPATH ]; then
	python experiment.py selection247 exps_set2/selection247
fi
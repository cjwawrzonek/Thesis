#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection294/selection294.exp"
if [ -f $FPATH ]; then
	python experiment.py selection294 exps_set2/selection294
fi
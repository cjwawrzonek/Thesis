#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection246/selection246.exp"
if [ -f $FPATH ]; then
	python experiment.py selection246 exps_set2/selection246
fi
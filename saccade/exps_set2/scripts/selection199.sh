#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection199/selection199.exp"
if [ -f $FPATH ]; then
	python experiment.py selection199 exps_set2/selection199
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection268/selection268.exp"
if [ -f $FPATH ]; then
	python experiment.py selection268 exps_set2/selection268
fi
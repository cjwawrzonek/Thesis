#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection154/selection154.exp"
if [ -f $FPATH ]; then
	python experiment.py selection154 exps_set2/selection154
fi
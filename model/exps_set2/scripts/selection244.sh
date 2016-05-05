#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection244/selection244.exp"
if [ -f $FPATH ]; then
	python experiment.py selection244 exps_set2/selection244
fi
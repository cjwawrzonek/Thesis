#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection262/selection262.exp"
if [ -f $FPATH ]; then
	python experiment.py selection262 exps_set2/selection262
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection37/selection37.exp"
if [ -f $FPATH ]; then
	python experiment.py selection37 exps_set3/selection37
fi
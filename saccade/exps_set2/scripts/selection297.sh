#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection297/selection297.exp"
if [ -f $FPATH ]; then
	python experiment.py selection297 exps_set2/selection297
fi
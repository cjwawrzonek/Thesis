#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection25/selection25.exp"
if [ -f $FPATH ]; then
	python experiment.py selection25 exps_set2/selection25
fi
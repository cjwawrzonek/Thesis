#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection25/selection25.exp"
if [ -f $FPATH ]; then
	python experiment.py selection25 exps_set3/selection25
fi
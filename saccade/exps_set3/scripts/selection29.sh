#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection29/selection29.exp"
if [ -f $FPATH ]; then
	python experiment.py selection29 exps_set3/selection29
fi
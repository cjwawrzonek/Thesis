#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection29/selection29.exp"
if [ -f $FPATH ]; then
	python experiment.py selection29 exps_set2/selection29
fi
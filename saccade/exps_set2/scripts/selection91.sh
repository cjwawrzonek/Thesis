#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection91/selection91.exp"
if [ -f $FPATH ]; then
	python experiment.py selection91 exps_set2/selection91
fi
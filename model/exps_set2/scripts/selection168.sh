#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection168/selection168.exp"
if [ -f $FPATH ]; then
	python experiment.py selection168 exps_set2/selection168
fi
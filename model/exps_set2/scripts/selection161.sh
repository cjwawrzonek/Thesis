#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection161/selection161.exp"
if [ -f $FPATH ]; then
	python experiment.py selection161 exps_set2/selection161
fi
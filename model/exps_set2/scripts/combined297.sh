#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined297/combined297.exp"
if [ -f $FPATH ]; then
	python experiment.py combined297 exps_set2/combined297
fi
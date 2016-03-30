#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined269/combined269.exp"
if [ -f $FPATH ]; then
	python experiment.py combined269 exps_set2/combined269
fi
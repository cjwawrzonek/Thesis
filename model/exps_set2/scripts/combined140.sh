#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined140/combined140.exp"
if [ -f $FPATH ]; then
	python experiment.py combined140 exps_set2/combined140
fi
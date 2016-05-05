#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined278/combined278.exp"
if [ -f $FPATH ]; then
	python experiment.py combined278 exps_set2/combined278
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined299/combined299.exp"
if [ -f $FPATH ]; then
	python experiment.py combined299 exps_set2/combined299
fi
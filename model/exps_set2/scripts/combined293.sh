#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined293/combined293.exp"
if [ -f $FPATH ]; then
	python experiment.py combined293 exps_set2/combined293
fi
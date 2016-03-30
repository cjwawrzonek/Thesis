#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined52/combined52.exp"
if [ -f $FPATH ]; then
	python experiment.py combined52 exps_set2/combined52
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined54/combined54.exp"
if [ -f $FPATH ]; then
	python experiment.py combined54 exps_set3/combined54
fi
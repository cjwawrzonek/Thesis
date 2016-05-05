#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined31/combined31.exp"
if [ -f $FPATH ]; then
	python experiment.py combined31 exps_set2/combined31
fi
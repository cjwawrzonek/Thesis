#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined80/combined80.exp"
if [ -f $FPATH ]; then
	python experiment.py combined80 exps_set2/combined80
fi
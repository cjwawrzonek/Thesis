#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined209/combined209.exp"
if [ -f $FPATH ]; then
	python experiment.py combined209 exps_set2/combined209
fi
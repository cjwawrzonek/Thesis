#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined126/combined126.exp"
if [ -f $FPATH ]; then
	python experiment.py combined126 exps_set2/combined126
fi
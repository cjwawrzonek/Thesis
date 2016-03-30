#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined242/combined242.exp"
if [ -f $FPATH ]; then
	python experiment.py combined242 exps_set2/combined242
fi
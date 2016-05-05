#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined224/combined224.exp"
if [ -f $FPATH ]; then
	python experiment.py combined224 exps_set2/combined224
fi
#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined182/combined182.exp"
if [ -f $FPATH ]; then
	python experiment.py combined182 exps_set2/combined182
fi
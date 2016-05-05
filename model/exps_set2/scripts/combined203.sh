#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined203/combined203.exp"
if [ -f $FPATH ]; then
	python experiment.py combined203 exps_set2/combined203
fi
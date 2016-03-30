#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined170/combined170.exp"
if [ -f $FPATH ]; then
	python experiment.py combined170 exps_set2/combined170
fi
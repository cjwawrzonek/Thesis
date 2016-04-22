#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined82/combined82.exp"
if [ -f $FPATH ]; then
	python experiment.py combined82 exps_set3/combined82
fi
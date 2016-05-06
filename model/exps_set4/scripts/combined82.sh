#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined82/combined82.exp"
if [ -f $FPATH ]; then
	python experiment.py combined82 exps_set4/combined82
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined82/combined82.exp"
if [ -f $FPATH ]; then
	python experiment.py combined82 experiments/combined82
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined110/combined110.exp"
if [ -f $FPATH ]; then
	python experiment.py combined110 experiments/combined110
fi
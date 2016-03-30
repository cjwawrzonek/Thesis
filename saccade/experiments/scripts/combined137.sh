#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined137/combined137.exp"
if [ -f $FPATH ]; then
	python experiment.py combined137 experiments/combined137
fi
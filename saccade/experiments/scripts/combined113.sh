#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined113/combined113.exp"
if [ -f $FPATH ]; then
	python experiment.py combined113 experiments/combined113
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection156/selection156.exp"
if [ -f $FPATH ]; then
	python experiment.py selection156 experiments/selection156
fi
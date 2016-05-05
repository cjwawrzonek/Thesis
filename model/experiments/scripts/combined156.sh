#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined156/combined156.exp"
if [ -f $FPATH ]; then
	python experiment.py combined156 experiments/combined156
fi
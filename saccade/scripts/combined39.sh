#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined39/combined39.exp"
if [ -f $FPATH ]; then
	python experiment.py combined39 experiments/combined39
fi
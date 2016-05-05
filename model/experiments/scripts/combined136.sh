#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined136/combined136.exp"
if [ -f $FPATH ]; then
	python experiment.py combined136 experiments/combined136
fi
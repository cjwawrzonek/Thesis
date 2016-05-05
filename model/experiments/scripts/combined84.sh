#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined84/combined84.exp"
if [ -f $FPATH ]; then
	python experiment.py combined84 experiments/combined84
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined65/combined65.exp"
if [ -f $FPATH ]; then
	python experiment.py combined65 experiments/combined65
fi
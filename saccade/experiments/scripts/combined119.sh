#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined119/combined119.exp"
if [ -f $FPATH ]; then
	python experiment.py combined119 experiments/combined119
fi
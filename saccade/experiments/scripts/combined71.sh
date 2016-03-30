#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined71/combined71.exp"
if [ -f $FPATH ]; then
	python experiment.py combined71 experiments/combined71
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined14/combined14.exp"
if [ -f $FPATH ]; then
	python experiment.py combined14 experiments/combined14
fi
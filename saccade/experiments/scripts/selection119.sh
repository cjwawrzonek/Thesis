#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection119/selection119.exp"
if [ -f $FPATH ]; then
	python experiment.py selection119 experiments/selection119
fi
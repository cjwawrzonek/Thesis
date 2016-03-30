#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection149/selection149.exp"
if [ -f $FPATH ]; then
	python experiment.py selection149 experiments/selection149
fi
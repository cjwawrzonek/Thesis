#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection120/selection120.exp"
if [ -f $FPATH ]; then
	python experiment.py selection120 experiments/selection120
fi
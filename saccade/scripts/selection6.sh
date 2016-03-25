#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection6/selection6.exp"
if [ -f $FPATH ]; then
	python experiment.py selection6 experiments/selection6
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection155/selection155.exp"
if [ -f $FPATH ]; then
	python experiment.py selection155 experiments/selection155
fi
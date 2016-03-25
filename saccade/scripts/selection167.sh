#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection167/selection167.exp"
if [ -f $FPATH ]; then
	python experiment.py selection167 experiments/selection167
fi
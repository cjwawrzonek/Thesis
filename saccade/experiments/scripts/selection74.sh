#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection74/selection74.exp"
if [ -f $FPATH ]; then
	python experiment.py selection74 experiments/selection74
fi
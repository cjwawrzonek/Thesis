#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection85/selection85.exp"
if [ -f $FPATH ]; then
	python experiment.py selection85 experiments/selection85
fi
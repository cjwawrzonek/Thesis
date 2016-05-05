#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection84/selection84.exp"
if [ -f $FPATH ]; then
	python experiment.py selection84 experiments/selection84
fi
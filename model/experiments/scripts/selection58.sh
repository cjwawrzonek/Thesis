#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection58/selection58.exp"
if [ -f $FPATH ]; then
	python experiment.py selection58 experiments/selection58
fi
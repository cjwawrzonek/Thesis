#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection43/selection43.exp"
if [ -f $FPATH ]; then
	python experiment.py selection43 experiments/selection43
fi
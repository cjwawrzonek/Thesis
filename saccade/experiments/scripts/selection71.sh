#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection71/selection71.exp"
if [ -f $FPATH ]; then
	python experiment.py selection71 experiments/selection71
fi
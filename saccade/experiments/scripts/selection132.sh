#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection132/selection132.exp"
if [ -f $FPATH ]; then
	python experiment.py selection132 experiments/selection132
fi
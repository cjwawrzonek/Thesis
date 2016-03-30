#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection90/selection90.exp"
if [ -f $FPATH ]; then
	python experiment.py selection90 experiments/selection90
fi
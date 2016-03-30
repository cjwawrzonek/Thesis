#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection67/selection67.exp"
if [ -f $FPATH ]; then
	python experiment.py selection67 experiments/selection67
fi
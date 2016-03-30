#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection135/selection135.exp"
if [ -f $FPATH ]; then
	python experiment.py selection135 experiments/selection135
fi
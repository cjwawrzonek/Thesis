#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection150/selection150.exp"
if [ -f $FPATH ]; then
	python experiment.py selection150 experiments/selection150
fi
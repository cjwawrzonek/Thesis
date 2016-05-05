#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection17/selection17.exp"
if [ -f $FPATH ]; then
	python experiment.py selection17 experiments/selection17
fi
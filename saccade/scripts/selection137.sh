#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection137/selection137.exp"
if [ -f $FPATH ]; then
	python experiment.py selection137 experiments/selection137
fi
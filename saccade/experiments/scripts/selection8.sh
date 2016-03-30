#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection8/selection8.exp"
if [ -f $FPATH ]; then
	python experiment.py selection8 experiments/selection8
fi
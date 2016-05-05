#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection82/selection82.exp"
if [ -f $FPATH ]; then
	python experiment.py selection82 experiments/selection82
fi
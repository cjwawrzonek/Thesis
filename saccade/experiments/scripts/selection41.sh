#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection41/selection41.exp"
if [ -f $FPATH ]; then
	python experiment.py selection41 experiments/selection41
fi
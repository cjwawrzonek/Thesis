#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection121/selection121.exp"
if [ -f $FPATH ]; then
	python experiment.py selection121 experiments/selection121
fi
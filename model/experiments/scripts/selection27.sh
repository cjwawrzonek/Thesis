#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection27/selection27.exp"
if [ -f $FPATH ]; then
	python experiment.py selection27 experiments/selection27
fi
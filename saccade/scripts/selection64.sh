#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection64/selection64.exp"
if [ -f $FPATH ]; then
	python experiment.py selection64 experiments/selection64
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection21/selection21.exp"
if [ -f $FPATH ]; then
	python experiment.py selection21 experiments/selection21
fi
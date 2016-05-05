#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection83/selection83.exp"
if [ -f $FPATH ]; then
	python experiment.py selection83 experiments/selection83
fi
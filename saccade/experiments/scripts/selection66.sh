#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection66/selection66.exp"
if [ -f $FPATH ]; then
	python experiment.py selection66 experiments/selection66
fi
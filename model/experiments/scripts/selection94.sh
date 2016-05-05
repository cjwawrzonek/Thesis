#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection94/selection94.exp"
if [ -f $FPATH ]; then
	python experiment.py selection94 experiments/selection94
fi
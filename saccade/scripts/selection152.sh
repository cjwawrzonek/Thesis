#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection152/selection152.exp"
if [ -f $FPATH ]; then
	python experiment.py selection152 experiments/selection152
fi
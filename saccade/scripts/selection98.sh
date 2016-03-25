#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection98/selection98.exp"
if [ -f $FPATH ]; then
	python experiment.py selection98 experiments/selection98
fi
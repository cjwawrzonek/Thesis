#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection136/selection136.exp"
if [ -f $FPATH ]; then
	python experiment.py selection136 experiments/selection136
fi
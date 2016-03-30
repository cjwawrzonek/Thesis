#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection4/selection4.exp"
if [ -f $FPATH ]; then
	python experiment.py selection4 experiments/selection4
fi
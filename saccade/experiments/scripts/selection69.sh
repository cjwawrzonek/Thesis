#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection69/selection69.exp"
if [ -f $FPATH ]; then
	python experiment.py selection69 experiments/selection69
fi
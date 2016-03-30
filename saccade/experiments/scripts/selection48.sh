#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection48/selection48.exp"
if [ -f $FPATH ]; then
	python experiment.py selection48 experiments/selection48
fi
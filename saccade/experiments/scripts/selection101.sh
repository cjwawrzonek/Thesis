#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection101/selection101.exp"
if [ -f $FPATH ]; then
	python experiment.py selection101 experiments/selection101
fi
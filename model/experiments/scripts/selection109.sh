#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection109/selection109.exp"
if [ -f $FPATH ]; then
	python experiment.py selection109 experiments/selection109
fi
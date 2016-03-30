#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection5/selection5.exp"
if [ -f $FPATH ]; then
	python experiment.py selection5 experiments/selection5
fi
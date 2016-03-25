#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection130/selection130.exp"
if [ -f $FPATH ]; then
	python experiment.py selection130 experiments/selection130
fi
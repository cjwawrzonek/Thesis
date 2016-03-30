#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection140/selection140.exp"
if [ -f $FPATH ]; then
	python experiment.py selection140 experiments/selection140
fi
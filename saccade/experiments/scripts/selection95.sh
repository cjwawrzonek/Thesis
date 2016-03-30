#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection95/selection95.exp"
if [ -f $FPATH ]; then
	python experiment.py selection95 experiments/selection95
fi
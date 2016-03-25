#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection28/selection28.exp"
if [ -f $FPATH ]; then
	python experiment.py selection28 experiments/selection28
fi
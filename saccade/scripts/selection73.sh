#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection73/selection73.exp"
if [ -f $FPATH ]; then
	python experiment.py selection73 experiments/selection73
fi
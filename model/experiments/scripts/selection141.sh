#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection141/selection141.exp"
if [ -f $FPATH ]; then
	python experiment.py selection141 experiments/selection141
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection170/selection170.exp"
if [ -f $FPATH ]; then
	python experiment.py selection170 experiments/selection170
fi
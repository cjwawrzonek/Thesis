#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection55/selection55.exp"
if [ -f $FPATH ]; then
	python experiment.py selection55 experiments/selection55
fi
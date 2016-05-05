#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection39/selection39.exp"
if [ -f $FPATH ]; then
	python experiment.py selection39 experiments/selection39
fi
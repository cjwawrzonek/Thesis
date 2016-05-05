#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection114/selection114.exp"
if [ -f $FPATH ]; then
	python experiment.py selection114 experiments/selection114
fi
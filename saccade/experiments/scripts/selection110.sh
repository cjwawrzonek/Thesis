#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection110/selection110.exp"
if [ -f $FPATH ]; then
	python experiment.py selection110 experiments/selection110
fi
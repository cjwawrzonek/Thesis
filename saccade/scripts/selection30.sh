#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection30/selection30.exp"
if [ -f $FPATH ]; then
	python experiment.py selection30 experiments/selection30
fi
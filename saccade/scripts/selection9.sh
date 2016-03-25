#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection9/selection9.exp"
if [ -f $FPATH ]; then
	python experiment.py selection9 experiments/selection9
fi
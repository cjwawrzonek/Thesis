#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection112/selection112.exp"
if [ -f $FPATH ]; then
	python experiment.py selection112 experiments/selection112
fi
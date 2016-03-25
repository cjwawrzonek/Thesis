#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection128/selection128.exp"
if [ -f $FPATH ]; then
	python experiment.py selection128 experiments/selection128
fi
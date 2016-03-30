#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection32/selection32.exp"
if [ -f $FPATH ]; then
	python experiment.py selection32 experiments/selection32
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection81/selection81.exp"
if [ -f $FPATH ]; then
	python experiment.py selection81 experiments/selection81
fi
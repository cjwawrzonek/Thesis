#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection61/selection61.exp"
if [ -f $FPATH ]; then
	python experiment.py selection61 experiments/selection61
fi
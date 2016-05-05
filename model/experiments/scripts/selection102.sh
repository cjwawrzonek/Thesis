#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection102/selection102.exp"
if [ -f $FPATH ]; then
	python experiment.py selection102 experiments/selection102
fi
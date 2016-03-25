#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection3/selection3.exp"
if [ -f $FPATH ]; then
	python experiment.py selection3 experiments/selection3
fi
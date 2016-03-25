#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined73/combined73.exp"
if [ -f $FPATH ]; then
	python experiment.py combined73 experiments/combined73
fi
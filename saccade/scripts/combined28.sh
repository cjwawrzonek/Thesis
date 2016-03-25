#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined28/combined28.exp"
if [ -f $FPATH ]; then
	python experiment.py combined28 experiments/combined28
fi
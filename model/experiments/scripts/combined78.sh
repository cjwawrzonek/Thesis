#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined78/combined78.exp"
if [ -f $FPATH ]; then
	python experiment.py combined78 experiments/combined78
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined120/combined120.exp"
if [ -f $FPATH ]; then
	python experiment.py combined120 experiments/combined120
fi
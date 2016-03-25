#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined61/combined61.exp"
if [ -f $FPATH ]; then
	python experiment.py combined61 experiments/combined61
fi
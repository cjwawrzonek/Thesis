#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined72/combined72.exp"
if [ -f $FPATH ]; then
	python experiment.py combined72 experiments/combined72
fi
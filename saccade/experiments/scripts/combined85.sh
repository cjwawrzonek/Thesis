#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined85/combined85.exp"
if [ -f $FPATH ]; then
	python experiment.py combined85 experiments/combined85
fi
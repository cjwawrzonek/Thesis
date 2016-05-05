#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined74/combined74.exp"
if [ -f $FPATH ]; then
	python experiment.py combined74 experiments/combined74
fi
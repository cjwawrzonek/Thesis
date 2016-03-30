#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined108/combined108.exp"
if [ -f $FPATH ]; then
	python experiment.py combined108 experiments/combined108
fi
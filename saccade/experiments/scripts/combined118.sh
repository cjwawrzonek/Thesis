#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined118/combined118.exp"
if [ -f $FPATH ]; then
	python experiment.py combined118 experiments/combined118
fi
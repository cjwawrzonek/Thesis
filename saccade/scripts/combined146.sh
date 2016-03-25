#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined146/combined146.exp"
if [ -f $FPATH ]; then
	python experiment.py combined146 experiments/combined146
fi
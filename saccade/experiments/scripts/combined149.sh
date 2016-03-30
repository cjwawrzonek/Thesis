#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined149/combined149.exp"
if [ -f $FPATH ]; then
	python experiment.py combined149 experiments/combined149
fi
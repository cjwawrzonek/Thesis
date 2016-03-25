#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined138/combined138.exp"
if [ -f $FPATH ]; then
	python experiment.py combined138 experiments/combined138
fi
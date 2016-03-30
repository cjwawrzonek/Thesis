#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined155/combined155.exp"
if [ -f $FPATH ]; then
	python experiment.py combined155 experiments/combined155
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined122/combined122.exp"
if [ -f $FPATH ]; then
	python experiment.py combined122 experiments/combined122
fi
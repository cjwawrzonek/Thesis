#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined101/combined101.exp"
if [ -f $FPATH ]; then
	python experiment.py combined101 experiments/combined101
fi
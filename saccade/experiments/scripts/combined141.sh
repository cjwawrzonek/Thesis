#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined141/combined141.exp"
if [ -f $FPATH ]; then
	python experiment.py combined141 experiments/combined141
fi
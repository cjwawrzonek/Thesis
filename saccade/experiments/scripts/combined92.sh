#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined92/combined92.exp"
if [ -f $FPATH ]; then
	python experiment.py combined92 experiments/combined92
fi
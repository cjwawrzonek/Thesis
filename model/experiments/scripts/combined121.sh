#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined121/combined121.exp"
if [ -f $FPATH ]; then
	python experiment.py combined121 experiments/combined121
fi
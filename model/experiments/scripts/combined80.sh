#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined80/combined80.exp"
if [ -f $FPATH ]; then
	python experiment.py combined80 experiments/combined80
fi
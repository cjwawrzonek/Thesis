#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined125/combined125.exp"
if [ -f $FPATH ]; then
	python experiment.py combined125 experiments/combined125
fi
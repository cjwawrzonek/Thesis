#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined38/combined38.exp"
if [ -f $FPATH ]; then
	python experiment.py combined38 experiments/combined38
fi
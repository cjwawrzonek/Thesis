#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined66/combined66.exp"
if [ -f $FPATH ]; then
	python experiment.py combined66 experiments/combined66
fi
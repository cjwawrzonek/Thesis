#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined50/combined50.exp"
if [ -f $FPATH ]; then
	python experiment.py combined50 experiments/combined50
fi
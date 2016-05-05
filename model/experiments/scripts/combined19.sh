#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined19/combined19.exp"
if [ -f $FPATH ]; then
	python experiment.py combined19 experiments/combined19
fi
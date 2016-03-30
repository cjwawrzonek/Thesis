#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined124/combined124.exp"
if [ -f $FPATH ]; then
	python experiment.py combined124 experiments/combined124
fi
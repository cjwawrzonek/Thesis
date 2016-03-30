#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined130/combined130.exp"
if [ -f $FPATH ]; then
	python experiment.py combined130 experiments/combined130
fi
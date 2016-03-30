#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined68/combined68.exp"
if [ -f $FPATH ]; then
	python experiment.py combined68 experiments/combined68
fi
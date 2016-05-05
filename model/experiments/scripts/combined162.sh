#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined162/combined162.exp"
if [ -f $FPATH ]; then
	python experiment.py combined162 experiments/combined162
fi
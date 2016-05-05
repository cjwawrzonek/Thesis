#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined86/combined86.exp"
if [ -f $FPATH ]; then
	python experiment.py combined86 experiments/combined86
fi
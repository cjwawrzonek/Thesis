#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined32/combined32.exp"
if [ -f $FPATH ]; then
	python experiment.py combined32 experiments/combined32
fi
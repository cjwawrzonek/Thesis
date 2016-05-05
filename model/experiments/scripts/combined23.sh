#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined23/combined23.exp"
if [ -f $FPATH ]; then
	python experiment.py combined23 experiments/combined23
fi
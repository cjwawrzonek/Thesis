#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined33/combined33.exp"
if [ -f $FPATH ]; then
	python experiment.py combined33 experiments/combined33
fi
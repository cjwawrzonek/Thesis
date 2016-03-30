#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined67/combined67.exp"
if [ -f $FPATH ]; then
	python experiment.py combined67 experiments/combined67
fi
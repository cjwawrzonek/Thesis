#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined69/combined69.exp"
if [ -f $FPATH ]; then
	python experiment.py combined69 experiments/combined69
fi
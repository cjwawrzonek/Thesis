#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined79/combined79.exp"
if [ -f $FPATH ]; then
	python experiment.py combined79 experiments/combined79
fi
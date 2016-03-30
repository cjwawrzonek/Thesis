#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined75/combined75.exp"
if [ -f $FPATH ]; then
	python experiment.py combined75 experiments/combined75
fi
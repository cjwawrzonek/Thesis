#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined70/combined70.exp"
if [ -f $FPATH ]; then
	python experiment.py combined70 experiments/combined70
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined37/combined37.exp"
if [ -f $FPATH ]; then
	python experiment.py combined37 experiments/combined37
fi
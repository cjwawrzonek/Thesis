#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined5/combined5.exp"
if [ -f $FPATH ]; then
	python experiment.py combined5 experiments/combined5
fi
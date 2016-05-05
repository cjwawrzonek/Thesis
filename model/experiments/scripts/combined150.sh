#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined150/combined150.exp"
if [ -f $FPATH ]; then
	python experiment.py combined150 experiments/combined150
fi
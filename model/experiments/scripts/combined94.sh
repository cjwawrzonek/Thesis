#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined94/combined94.exp"
if [ -f $FPATH ]; then
	python experiment.py combined94 experiments/combined94
fi
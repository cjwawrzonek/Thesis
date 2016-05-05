#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined41/combined41.exp"
if [ -f $FPATH ]; then
	python experiment.py combined41 experiments/combined41
fi
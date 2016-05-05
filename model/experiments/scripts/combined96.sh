#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined96/combined96.exp"
if [ -f $FPATH ]; then
	python experiment.py combined96 experiments/combined96
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined13/combined13.exp"
if [ -f $FPATH ]; then
	python experiment.py combined13 experiments/combined13
fi
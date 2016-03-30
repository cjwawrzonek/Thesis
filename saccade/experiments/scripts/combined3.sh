#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined3/combined3.exp"
if [ -f $FPATH ]; then
	python experiment.py combined3 experiments/combined3
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined109/combined109.exp"
if [ -f $FPATH ]; then
	python experiment.py combined109 experiments/combined109
fi
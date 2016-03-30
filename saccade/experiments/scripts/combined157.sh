#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined157/combined157.exp"
if [ -f $FPATH ]; then
	python experiment.py combined157 experiments/combined157
fi
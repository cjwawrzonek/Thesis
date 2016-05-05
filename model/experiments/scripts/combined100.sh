#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined100/combined100.exp"
if [ -f $FPATH ]; then
	python experiment.py combined100 experiments/combined100
fi
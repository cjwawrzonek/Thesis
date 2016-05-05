#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined128/combined128.exp"
if [ -f $FPATH ]; then
	python experiment.py combined128 experiments/combined128
fi
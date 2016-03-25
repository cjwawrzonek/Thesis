#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined7/combined7.exp"
if [ -f $FPATH ]; then
	python experiment.py combined7 experiments/combined7
fi
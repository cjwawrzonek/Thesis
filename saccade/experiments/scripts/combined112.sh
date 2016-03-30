#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined112/combined112.exp"
if [ -f $FPATH ]; then
	python experiment.py combined112 experiments/combined112
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined145/combined145.exp"
if [ -f $FPATH ]; then
	python experiment.py combined145 experiments/combined145
fi
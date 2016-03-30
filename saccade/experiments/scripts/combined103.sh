#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined103/combined103.exp"
if [ -f $FPATH ]; then
	python experiment.py combined103 experiments/combined103
fi
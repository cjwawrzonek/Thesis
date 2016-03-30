#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined40/combined40.exp"
if [ -f $FPATH ]; then
	python experiment.py combined40 experiments/combined40
fi
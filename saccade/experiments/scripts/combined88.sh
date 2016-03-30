#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined88/combined88.exp"
if [ -f $FPATH ]; then
	python experiment.py combined88 experiments/combined88
fi
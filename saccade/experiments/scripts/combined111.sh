#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined111/combined111.exp"
if [ -f $FPATH ]; then
	python experiment.py combined111 experiments/combined111
fi
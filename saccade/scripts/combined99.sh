#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined99/combined99.exp"
if [ -f $FPATH ]; then
	python experiment.py combined99 experiments/combined99
fi
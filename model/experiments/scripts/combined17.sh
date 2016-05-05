#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined17/combined17.exp"
if [ -f $FPATH ]; then
	python experiment.py combined17 experiments/combined17
fi
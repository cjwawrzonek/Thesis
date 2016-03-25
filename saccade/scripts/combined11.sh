#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined11/combined11.exp"
if [ -f $FPATH ]; then
	python experiment.py combined11 experiments/combined11
fi
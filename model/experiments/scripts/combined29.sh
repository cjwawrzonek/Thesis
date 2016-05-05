#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined29/combined29.exp"
if [ -f $FPATH ]; then
	python experiment.py combined29 experiments/combined29
fi
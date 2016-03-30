#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined114/combined114.exp"
if [ -f $FPATH ]; then
	python experiment.py combined114 experiments/combined114
fi
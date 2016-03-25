#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined140/combined140.exp"
if [ -f $FPATH ]; then
	python experiment.py combined140 experiments/combined140
fi
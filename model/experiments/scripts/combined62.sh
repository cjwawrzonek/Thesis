#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined62/combined62.exp"
if [ -f $FPATH ]; then
	python experiment.py combined62 experiments/combined62
fi
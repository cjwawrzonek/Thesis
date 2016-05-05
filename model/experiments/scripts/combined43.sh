#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined43/combined43.exp"
if [ -f $FPATH ]; then
	python experiment.py combined43 experiments/combined43
fi
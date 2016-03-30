#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection148/selection148.exp"
if [ -f $FPATH ]; then
	python experiment.py selection148 experiments/selection148
fi
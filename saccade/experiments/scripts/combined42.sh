#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined42/combined42.exp"
if [ -f $FPATH ]; then
	python experiment.py combined42 experiments/combined42
fi
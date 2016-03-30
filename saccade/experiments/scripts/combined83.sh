#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined83/combined83.exp"
if [ -f $FPATH ]; then
	python experiment.py combined83 experiments/combined83
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined142/combined142.exp"
if [ -f $FPATH ]; then
	python experiment.py combined142 experiments/combined142
fi
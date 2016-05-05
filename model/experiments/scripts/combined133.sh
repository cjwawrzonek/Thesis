#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined133/combined133.exp"
if [ -f $FPATH ]; then
	python experiment.py combined133 experiments/combined133
fi
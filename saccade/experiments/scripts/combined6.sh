#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined6/combined6.exp"
if [ -f $FPATH ]; then
	python experiment.py combined6 experiments/combined6
fi
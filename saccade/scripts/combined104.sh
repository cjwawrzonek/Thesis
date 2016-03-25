#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined104/combined104.exp"
if [ -f $FPATH ]; then
	python experiment.py combined104 experiments/combined104
fi
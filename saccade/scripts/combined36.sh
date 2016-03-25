#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined36/combined36.exp"
if [ -f $FPATH ]; then
	python experiment.py combined36 experiments/combined36
fi
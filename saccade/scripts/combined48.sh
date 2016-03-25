#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined48/combined48.exp"
if [ -f $FPATH ]; then
	python experiment.py combined48 experiments/combined48
fi
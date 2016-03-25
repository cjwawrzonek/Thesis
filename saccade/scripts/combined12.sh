#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined12/combined12.exp"
if [ -f $FPATH ]; then
	python experiment.py combined12 experiments/combined12
fi
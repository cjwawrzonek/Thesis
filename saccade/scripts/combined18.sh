#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined18/combined18.exp"
if [ -f $FPATH ]; then
	python experiment.py combined18 experiments/combined18
fi
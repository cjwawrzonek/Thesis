#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined135/combined135.exp"
if [ -f $FPATH ]; then
	python experiment.py combined135 experiments/combined135
fi
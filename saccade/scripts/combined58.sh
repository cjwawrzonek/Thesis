#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined58/combined58.exp"
if [ -f $FPATH ]; then
	python experiment.py combined58 experiments/combined58
fi
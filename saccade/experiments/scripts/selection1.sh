#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection1/selection1.exp"
if [ -f $FPATH ]; then
	python experiment.py selection1 experiments/selection1
fi
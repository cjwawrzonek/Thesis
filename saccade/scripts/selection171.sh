#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection171/selection171.exp"
if [ -f $FPATH ]; then
	python experiment.py selection171 experiments/selection171
fi
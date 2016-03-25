#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection96/selection96.exp"
if [ -f $FPATH ]; then
	python experiment.py selection96 experiments/selection96
fi
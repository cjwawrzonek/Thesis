#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection24/selection24.exp"
if [ -f $FPATH ]; then
	python experiment.py selection24 experiments/selection24
fi
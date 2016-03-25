#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection49/selection49.exp"
if [ -f $FPATH ]; then
	python experiment.py selection49 experiments/selection49
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection133/selection133.exp"
if [ -f $FPATH ]; then
	python experiment.py selection133 experiments/selection133
fi
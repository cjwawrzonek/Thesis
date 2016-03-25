#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection145/selection145.exp"
if [ -f $FPATH ]; then
	python experiment.py selection145 experiments/selection145
fi
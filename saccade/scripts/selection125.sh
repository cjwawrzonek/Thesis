#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection125/selection125.exp"
if [ -f $FPATH ]; then
	python experiment.py selection125 experiments/selection125
fi
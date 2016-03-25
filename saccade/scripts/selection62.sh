#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection62/selection62.exp"
if [ -f $FPATH ]; then
	python experiment.py selection62 experiments/selection62
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection70/selection70.exp"
if [ -f $FPATH ]; then
	python experiment.py selection70 experiments/selection70
fi
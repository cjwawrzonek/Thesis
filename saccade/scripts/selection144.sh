#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection144/selection144.exp"
if [ -f $FPATH ]; then
	python experiment.py selection144 experiments/selection144
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection75/selection75.exp"
if [ -f $FPATH ]; then
	python experiment.py selection75 experiments/selection75
fi
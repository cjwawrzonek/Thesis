#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection117/selection117.exp"
if [ -f $FPATH ]; then
	python experiment.py selection117 experiments/selection117
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection77/selection77.exp"
if [ -f $FPATH ]; then
	python experiment.py selection77 experiments/selection77
fi
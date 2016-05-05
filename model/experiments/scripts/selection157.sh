#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection157/selection157.exp"
if [ -f $FPATH ]; then
	python experiment.py selection157 experiments/selection157
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection34/selection34.exp"
if [ -f $FPATH ]; then
	python experiment.py selection34 experiments/selection34
fi
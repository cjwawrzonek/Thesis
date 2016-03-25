#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection42/selection42.exp"
if [ -f $FPATH ]; then
	python experiment.py selection42 experiments/selection42
fi
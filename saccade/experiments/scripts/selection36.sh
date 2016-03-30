#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection36/selection36.exp"
if [ -f $FPATH ]; then
	python experiment.py selection36 experiments/selection36
fi
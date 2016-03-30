#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection111/selection111.exp"
if [ -f $FPATH ]; then
	python experiment.py selection111 experiments/selection111
fi
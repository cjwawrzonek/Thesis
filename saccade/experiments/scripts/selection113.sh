#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection113/selection113.exp"
if [ -f $FPATH ]; then
	python experiment.py selection113 experiments/selection113
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection108/selection108.exp"
if [ -f $FPATH ]; then
	python experiment.py selection108 experiments/selection108
fi
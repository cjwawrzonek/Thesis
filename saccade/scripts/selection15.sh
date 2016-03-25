#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection15/selection15.exp"
if [ -f $FPATH ]; then
	python experiment.py selection15 experiments/selection15
fi
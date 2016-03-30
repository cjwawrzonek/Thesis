#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection134/selection134.exp"
if [ -f $FPATH ]; then
	python experiment.py selection134 experiments/selection134
fi
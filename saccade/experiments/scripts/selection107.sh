#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection107/selection107.exp"
if [ -f $FPATH ]; then
	python experiment.py selection107 experiments/selection107
fi
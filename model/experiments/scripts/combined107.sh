#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined107/combined107.exp"
if [ -f $FPATH ]; then
	python experiment.py combined107 experiments/combined107
fi
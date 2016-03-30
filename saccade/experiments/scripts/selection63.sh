#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection63/selection63.exp"
if [ -f $FPATH ]; then
	python experiment.py selection63 experiments/selection63
fi
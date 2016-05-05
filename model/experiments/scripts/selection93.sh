#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection93/selection93.exp"
if [ -f $FPATH ]; then
	python experiment.py selection93 experiments/selection93
fi
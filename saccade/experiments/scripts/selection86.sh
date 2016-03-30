#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection86/selection86.exp"
if [ -f $FPATH ]; then
	python experiment.py selection86 experiments/selection86
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection166/selection166.exp"
if [ -f $FPATH ]; then
	python experiment.py selection166 experiments/selection166
fi
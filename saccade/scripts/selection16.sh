#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection16/selection16.exp"
if [ -f $FPATH ]; then
	python experiment.py selection16 experiments/selection16
fi
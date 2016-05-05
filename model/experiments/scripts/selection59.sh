#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection59/selection59.exp"
if [ -f $FPATH ]; then
	python experiment.py selection59 experiments/selection59
fi
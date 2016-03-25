#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection79/selection79.exp"
if [ -f $FPATH ]; then
	python experiment.py selection79 experiments/selection79
fi
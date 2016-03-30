#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection72/selection72.exp"
if [ -f $FPATH ]; then
	python experiment.py selection72 experiments/selection72
fi
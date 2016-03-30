#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection146/selection146.exp"
if [ -f $FPATH ]; then
	python experiment.py selection146 experiments/selection146
fi
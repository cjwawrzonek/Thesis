#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection20/selection20.exp"
if [ -f $FPATH ]; then
	python experiment.py selection20 experiments/selection20
fi
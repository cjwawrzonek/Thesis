#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection18/selection18.exp"
if [ -f $FPATH ]; then
	python experiment.py selection18 experiments/selection18
fi
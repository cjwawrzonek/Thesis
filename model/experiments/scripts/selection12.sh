#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection12/selection12.exp"
if [ -f $FPATH ]; then
	python experiment.py selection12 experiments/selection12
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection158/selection158.exp"
if [ -f $FPATH ]; then
	python experiment.py selection158 experiments/selection158
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection164/selection164.exp"
if [ -f $FPATH ]; then
	python experiment.py selection164 experiments/selection164
fi
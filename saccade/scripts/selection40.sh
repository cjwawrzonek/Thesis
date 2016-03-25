#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection40/selection40.exp"
if [ -f $FPATH ]; then
	python experiment.py selection40 experiments/selection40
fi
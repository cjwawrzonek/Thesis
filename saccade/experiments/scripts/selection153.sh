#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection153/selection153.exp"
if [ -f $FPATH ]; then
	python experiment.py selection153 experiments/selection153
fi
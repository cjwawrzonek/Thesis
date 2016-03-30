#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection151/selection151.exp"
if [ -f $FPATH ]; then
	python experiment.py selection151 experiments/selection151
fi
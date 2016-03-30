#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection53/selection53.exp"
if [ -f $FPATH ]; then
	python experiment.py selection53 experiments/selection53
fi
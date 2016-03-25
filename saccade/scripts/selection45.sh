#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection45/selection45.exp"
if [ -f $FPATH ]; then
	python experiment.py selection45 experiments/selection45
fi
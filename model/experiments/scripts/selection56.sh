#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection56/selection56.exp"
if [ -f $FPATH ]; then
	python experiment.py selection56 experiments/selection56
fi
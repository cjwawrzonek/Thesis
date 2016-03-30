#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection52/selection52.exp"
if [ -f $FPATH ]; then
	python experiment.py selection52 experiments/selection52
fi
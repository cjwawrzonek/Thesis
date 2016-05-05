#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection122/selection122.exp"
if [ -f $FPATH ]; then
	python experiment.py selection122 experiments/selection122
fi
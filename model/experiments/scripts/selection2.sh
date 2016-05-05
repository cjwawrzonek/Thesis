#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection2/selection2.exp"
if [ -f $FPATH ]; then
	python experiment.py selection2 experiments/selection2
fi
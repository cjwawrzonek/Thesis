#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection139/selection139.exp"
if [ -f $FPATH ]; then
	python experiment.py selection139 experiments/selection139
fi
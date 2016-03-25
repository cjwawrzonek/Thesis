#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection38/selection38.exp"
if [ -f $FPATH ]; then
	python experiment.py selection38 experiments/selection38
fi
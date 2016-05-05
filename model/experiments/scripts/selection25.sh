#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection25/selection25.exp"
if [ -f $FPATH ]; then
	python experiment.py selection25 experiments/selection25
fi
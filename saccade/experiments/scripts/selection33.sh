#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection33/selection33.exp"
if [ -f $FPATH ]; then
	python experiment.py selection33 experiments/selection33
fi
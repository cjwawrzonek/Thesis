#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection47/selection47.exp"
if [ -f $FPATH ]; then
	python experiment.py selection47 experiments/selection47
fi
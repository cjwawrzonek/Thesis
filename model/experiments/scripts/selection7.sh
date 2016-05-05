#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection7/selection7.exp"
if [ -f $FPATH ]; then
	python experiment.py selection7 experiments/selection7
fi
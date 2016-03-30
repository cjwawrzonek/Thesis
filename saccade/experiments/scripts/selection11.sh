#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection11/selection11.exp"
if [ -f $FPATH ]; then
	python experiment.py selection11 experiments/selection11
fi
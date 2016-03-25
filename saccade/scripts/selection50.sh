#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection50/selection50.exp"
if [ -f $FPATH ]; then
	python experiment.py selection50 experiments/selection50
fi
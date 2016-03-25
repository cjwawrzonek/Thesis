#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection57/selection57.exp"
if [ -f $FPATH ]; then
	python experiment.py selection57 experiments/selection57
fi
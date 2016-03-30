#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection154/selection154.exp"
if [ -f $FPATH ]; then
	python experiment.py selection154 experiments/selection154
fi
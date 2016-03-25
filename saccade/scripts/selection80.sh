#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection80/selection80.exp"
if [ -f $FPATH ]; then
	python experiment.py selection80 experiments/selection80
fi
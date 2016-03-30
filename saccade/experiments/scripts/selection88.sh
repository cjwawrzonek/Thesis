#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection88/selection88.exp"
if [ -f $FPATH ]; then
	python experiment.py selection88 experiments/selection88
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection115/selection115.exp"
if [ -f $FPATH ]; then
	python experiment.py selection115 experiments/selection115
fi
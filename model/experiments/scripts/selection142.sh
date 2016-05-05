#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection142/selection142.exp"
if [ -f $FPATH ]; then
	python experiment.py selection142 experiments/selection142
fi
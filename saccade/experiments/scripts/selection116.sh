#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection116/selection116.exp"
if [ -f $FPATH ]; then
	python experiment.py selection116 experiments/selection116
fi
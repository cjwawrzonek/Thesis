#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection13/selection13.exp"
if [ -f $FPATH ]; then
	python experiment.py selection13 experiments/selection13
fi
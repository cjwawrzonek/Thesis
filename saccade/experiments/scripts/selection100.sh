#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection100/selection100.exp"
if [ -f $FPATH ]; then
	python experiment.py selection100 experiments/selection100
fi
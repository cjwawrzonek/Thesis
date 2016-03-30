#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection26/selection26.exp"
if [ -f $FPATH ]; then
	python experiment.py selection26 experiments/selection26
fi
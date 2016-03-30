#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection87/selection87.exp"
if [ -f $FPATH ]; then
	python experiment.py selection87 experiments/selection87
fi
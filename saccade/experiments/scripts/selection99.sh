#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection99/selection99.exp"
if [ -f $FPATH ]; then
	python experiment.py selection99 experiments/selection99
fi
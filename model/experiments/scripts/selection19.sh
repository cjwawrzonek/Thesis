#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection19/selection19.exp"
if [ -f $FPATH ]; then
	python experiment.py selection19 experiments/selection19
fi
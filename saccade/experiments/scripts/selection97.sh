#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection97/selection97.exp"
if [ -f $FPATH ]; then
	python experiment.py selection97 experiments/selection97
fi
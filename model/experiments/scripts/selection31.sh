#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection31/selection31.exp"
if [ -f $FPATH ]; then
	python experiment.py selection31 experiments/selection31
fi
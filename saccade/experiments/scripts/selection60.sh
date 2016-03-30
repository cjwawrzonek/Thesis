#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection60/selection60.exp"
if [ -f $FPATH ]; then
	python experiment.py selection60 experiments/selection60
fi
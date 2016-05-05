#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection10/selection10.exp"
if [ -f $FPATH ]; then
	python experiment.py selection10 experiments/selection10
fi
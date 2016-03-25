#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection143/selection143.exp"
if [ -f $FPATH ]; then
	python experiment.py selection143 experiments/selection143
fi
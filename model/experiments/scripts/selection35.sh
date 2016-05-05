#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection35/selection35.exp"
if [ -f $FPATH ]; then
	python experiment.py selection35 experiments/selection35
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection161/selection161.exp"
if [ -f $FPATH ]; then
	python experiment.py selection161 experiments/selection161
fi
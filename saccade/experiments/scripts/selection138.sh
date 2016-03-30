#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection138/selection138.exp"
if [ -f $FPATH ]; then
	python experiment.py selection138 experiments/selection138
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection159/selection159.exp"
if [ -f $FPATH ]; then
	python experiment.py selection159 experiments/selection159
fi
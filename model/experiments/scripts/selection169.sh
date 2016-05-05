#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection169/selection169.exp"
if [ -f $FPATH ]; then
	python experiment.py selection169 experiments/selection169
fi
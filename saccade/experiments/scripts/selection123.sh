#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection123/selection123.exp"
if [ -f $FPATH ]; then
	python experiment.py selection123 experiments/selection123
fi
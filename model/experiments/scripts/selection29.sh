#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection29/selection29.exp"
if [ -f $FPATH ]; then
	python experiment.py selection29 experiments/selection29
fi
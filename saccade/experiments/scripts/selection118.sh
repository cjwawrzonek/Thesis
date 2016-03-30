#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection118/selection118.exp"
if [ -f $FPATH ]; then
	python experiment.py selection118 experiments/selection118
fi
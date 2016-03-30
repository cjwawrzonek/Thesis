#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection147/selection147.exp"
if [ -f $FPATH ]; then
	python experiment.py selection147 experiments/selection147
fi
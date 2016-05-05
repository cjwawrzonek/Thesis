#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection37/selection37.exp"
if [ -f $FPATH ]; then
	python experiment.py selection37 experiments/selection37
fi
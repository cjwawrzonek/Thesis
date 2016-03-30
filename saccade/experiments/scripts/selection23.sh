#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection23/selection23.exp"
if [ -f $FPATH ]; then
	python experiment.py selection23 experiments/selection23
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection124/selection124.exp"
if [ -f $FPATH ]; then
	python experiment.py selection124 experiments/selection124
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection105/selection105.exp"
if [ -f $FPATH ]; then
	python experiment.py selection105 experiments/selection105
fi
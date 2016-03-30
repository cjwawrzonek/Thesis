#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection106/selection106.exp"
if [ -f $FPATH ]; then
	python experiment.py selection106 experiments/selection106
fi
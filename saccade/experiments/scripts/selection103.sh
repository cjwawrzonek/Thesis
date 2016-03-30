#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection103/selection103.exp"
if [ -f $FPATH ]; then
	python experiment.py selection103 experiments/selection103
fi
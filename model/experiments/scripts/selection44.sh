#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/selection44/selection44.exp"
if [ -f $FPATH ]; then
	python experiment.py selection44 experiments/selection44
fi
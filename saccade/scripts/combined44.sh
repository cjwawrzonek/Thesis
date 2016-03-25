#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined44/combined44.exp"
if [ -f $FPATH ]; then
	python experiment.py combined44 experiments/combined44
fi
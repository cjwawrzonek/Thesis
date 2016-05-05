#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined53/combined53.exp"
if [ -f $FPATH ]; then
	python experiment.py combined53 experiments/combined53
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined90/combined90.exp"
if [ -f $FPATH ]; then
	python experiment.py combined90 experiments/combined90
fi
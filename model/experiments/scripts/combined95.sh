#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined95/combined95.exp"
if [ -f $FPATH ]; then
	python experiment.py combined95 experiments/combined95
fi
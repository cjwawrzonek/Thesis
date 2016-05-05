#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined30/combined30.exp"
if [ -f $FPATH ]; then
	python experiment.py combined30 experiments/combined30
fi
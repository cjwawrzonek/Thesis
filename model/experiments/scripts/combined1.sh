#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined1/combined1.exp"
if [ -f $FPATH ]; then
	python experiment.py combined1 experiments/combined1
fi
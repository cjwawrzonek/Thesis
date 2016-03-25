#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined60/combined60.exp"
if [ -f $FPATH ]; then
	python experiment.py combined60 experiments/combined60
fi
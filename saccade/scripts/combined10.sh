#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined10/combined10.exp"
if [ -f $FPATH ]; then
	python experiment.py combined10 experiments/combined10
fi
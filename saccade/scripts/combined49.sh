#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined49/combined49.exp"
if [ -f $FPATH ]; then
	python experiment.py combined49 experiments/combined49
fi
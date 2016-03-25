#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined76/combined76.exp"
if [ -f $FPATH ]; then
	python experiment.py combined76 experiments/combined76
fi
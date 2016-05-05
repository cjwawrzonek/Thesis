#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined57/combined57.exp"
if [ -f $FPATH ]; then
	python experiment.py combined57 experiments/combined57
fi
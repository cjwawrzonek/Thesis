#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined25/combined25.exp"
if [ -f $FPATH ]; then
	python experiment.py combined25 experiments/combined25
fi
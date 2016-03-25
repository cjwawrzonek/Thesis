#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined46/combined46.exp"
if [ -f $FPATH ]; then
	python experiment.py combined46 experiments/combined46
fi
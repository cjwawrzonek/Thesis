#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined31/combined31.exp"
if [ -f $FPATH ]; then
	python experiment.py combined31 experiments/combined31
fi
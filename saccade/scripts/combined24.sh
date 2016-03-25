#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined24/combined24.exp"
if [ -f $FPATH ]; then
	python experiment.py combined24 experiments/combined24
fi
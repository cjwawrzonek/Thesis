#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined164/combined164.exp"
if [ -f $FPATH ]; then
	python experiment.py combined164 experiments/combined164
fi
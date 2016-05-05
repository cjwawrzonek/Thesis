#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined64/combined64.exp"
if [ -f $FPATH ]; then
	python experiment.py combined64 experiments/combined64
fi
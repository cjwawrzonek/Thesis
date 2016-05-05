#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined21/combined21.exp"
if [ -f $FPATH ]; then
	python experiment.py combined21 experiments/combined21
fi
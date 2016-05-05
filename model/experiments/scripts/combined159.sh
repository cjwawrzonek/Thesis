#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined159/combined159.exp"
if [ -f $FPATH ]; then
	python experiment.py combined159 experiments/combined159
fi
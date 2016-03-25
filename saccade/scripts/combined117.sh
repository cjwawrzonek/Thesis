#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined117/combined117.exp"
if [ -f $FPATH ]; then
	python experiment.py combined117 experiments/combined117
fi
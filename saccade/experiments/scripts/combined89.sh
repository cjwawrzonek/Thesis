#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined89/combined89.exp"
if [ -f $FPATH ]; then
	python experiment.py combined89 experiments/combined89
fi
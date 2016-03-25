#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined143/combined143.exp"
if [ -f $FPATH ]; then
	python experiment.py combined143 experiments/combined143
fi
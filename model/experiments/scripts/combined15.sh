#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined15/combined15.exp"
if [ -f $FPATH ]; then
	python experiment.py combined15 experiments/combined15
fi
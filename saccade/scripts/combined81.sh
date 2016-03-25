#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined81/combined81.exp"
if [ -f $FPATH ]; then
	python experiment.py combined81 experiments/combined81
fi
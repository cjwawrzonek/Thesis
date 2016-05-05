#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined148/combined148.exp"
if [ -f $FPATH ]; then
	python experiment.py combined148 experiments/combined148
fi
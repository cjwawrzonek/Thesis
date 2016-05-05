#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined123/combined123.exp"
if [ -f $FPATH ]; then
	python experiment.py combined123 experiments/combined123
fi
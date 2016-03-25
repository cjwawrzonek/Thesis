#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined166/combined166.exp"
if [ -f $FPATH ]; then
	python experiment.py combined166 experiments/combined166
fi
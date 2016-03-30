#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined9/combined9.exp"
if [ -f $FPATH ]; then
	python experiment.py combined9 experiments/combined9
fi
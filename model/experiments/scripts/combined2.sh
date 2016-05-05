#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined2/combined2.exp"
if [ -f $FPATH ]; then
	python experiment.py combined2 experiments/combined2
fi
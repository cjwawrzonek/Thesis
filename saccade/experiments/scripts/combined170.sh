#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined170/combined170.exp"
if [ -f $FPATH ]; then
	python experiment.py combined170 experiments/combined170
fi
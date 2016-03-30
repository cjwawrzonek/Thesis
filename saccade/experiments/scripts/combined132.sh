#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined132/combined132.exp"
if [ -f $FPATH ]; then
	python experiment.py combined132 experiments/combined132
fi
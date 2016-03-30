#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined139/combined139.exp"
if [ -f $FPATH ]; then
	python experiment.py combined139 experiments/combined139
fi
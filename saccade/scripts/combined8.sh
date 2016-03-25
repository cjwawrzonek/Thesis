#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined8/combined8.exp"
if [ -f $FPATH ]; then
	python experiment.py combined8 experiments/combined8
fi
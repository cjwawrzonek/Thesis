#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined52/combined52.exp"
if [ -f $FPATH ]; then
	python experiment.py combined52 experiments/combined52
fi
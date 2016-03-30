#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined115/combined115.exp"
if [ -f $FPATH ]; then
	python experiment.py combined115 experiments/combined115
fi
#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined54/combined54.exp"
if [ -f $FPATH ]; then
	python experiment.py combined54 experiments/combined54
fi
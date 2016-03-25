#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined167/combined167.exp"
if [ -f $FPATH ]; then
	python experiment.py combined167 experiments/combined167
fi
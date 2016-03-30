#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined22/combined22.exp"
if [ -f $FPATH ]; then
	python experiment.py combined22 experiments/combined22
fi
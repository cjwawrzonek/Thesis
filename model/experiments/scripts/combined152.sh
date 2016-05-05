#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined152/combined152.exp"
if [ -f $FPATH ]; then
	python experiment.py combined152 experiments/combined152
fi